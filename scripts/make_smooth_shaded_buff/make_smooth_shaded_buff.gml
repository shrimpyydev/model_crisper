function make_smooth_shaded_buff(buffer) {
    var buff_size = buffer_get_size(buffer);
    var smooth_buff = buffer_create(buff_size, buffer_grow, 1);
    buffer_copy(buffer, 0, buff_size, smooth_buff, 0);

    // Step 1: Build a vertex index map to track shared vertices
    var vertex_map = {};
    var vertex_normals = {};
    var epsilon = power(1,-6); // Precision for considering vertices "equal"

    function almost_equal(v1, v2, epsilon) {
        return abs(v1[0] - v2[0]) < epsilon && abs(v1[1] - v2[1]) < epsilon && abs(v1[2] - v2[2]) < epsilon;
    }

    function add_to_vertex_map(v, triangle_normal, vertex_map, vertex_normals) {
        // Convert position to a string key for indexing
        var key = stringify_coordinates(v[0], v[1], v[2], 8);
        if (!struct_exists(vertex_map, key)) {
            struct_set(vertex_map, key, v);
            struct_set(vertex_normals, key, triangle_normal);
            show_debug_message("Adding new vertex: " + key + " with normal: " + string(triangle_normal));
        } else {
            var existing_normal = struct_get(vertex_normals, key);
            existing_normal[0] += triangle_normal[0];
            existing_normal[1] += triangle_normal[1];
            existing_normal[2] += triangle_normal[2];
            struct_set(vertex_normals, key, existing_normal);
            show_debug_message("Updated vertex: " + key + " with new normal: " + string(existing_normal));
        }
    }

    // Step 2: Loop through triangles and compute normals
    for (var i = 0; i < buffer_get_size(smooth_buff); i += 3 * 36) {
        var v1 = [
            buffer_peek(smooth_buff, i + 0, buffer_f32),
            buffer_peek(smooth_buff, i + 4, buffer_f32),
            buffer_peek(smooth_buff, i + 8, buffer_f32)
        ];
        var v2 = [
            buffer_peek(smooth_buff, i + 0 + 36, buffer_f32),
            buffer_peek(smooth_buff, i + 4 + 36, buffer_f32),
            buffer_peek(smooth_buff, i + 8 + 36, buffer_f32)
        ];
        var v3 = [
            buffer_peek(smooth_buff, i + 0 + 72, buffer_f32),
            buffer_peek(smooth_buff, i + 4 + 72, buffer_f32),
            buffer_peek(smooth_buff, i + 8 + 72, buffer_f32)
        ];

        // Compute vectors and triangle normal
        var vec1 = [v2[0] - v1[0], v2[1] - v1[1], v2[2] - v1[2]];
        var vec2 = [v3[0] - v1[0], v3[1] - v1[1], v3[2] - v1[2]];
        var cross = [
            vec1[1] * vec2[2] - vec1[2] * vec2[1],
            vec1[2] * vec2[0] - vec1[0] * vec2[2],
            vec1[0] * vec2[1] - vec1[1] * vec2[0]
        ];

        // Normalize the cross product
        var length = sqrt(cross[0] * cross[0] + cross[1] * cross[1] + cross[2] * cross[2]);
        if (length > epsilon) {
            cross[0] /= length;
            cross[1] /= length;
            cross[2] /= length;
        } else {
            cross = [0, 0, 0];
        }

        // Debugging the computed normal
        show_debug_message("Triangle normal: " + string(cross));

        // Add normals to the vertex map
        add_to_vertex_map(v1, cross, vertex_map, vertex_normals);
        add_to_vertex_map(v2, cross, vertex_map, vertex_normals);
        add_to_vertex_map(v3, cross, vertex_map, vertex_normals);
    }

    // Step 3: Assign averaged normals to vertices
    for (i = 0; i < buffer_get_size(smooth_buff); i += 36) {
        var vx = buffer_peek(smooth_buff, i + 0, buffer_f32);
        var vy = buffer_peek(smooth_buff, i + 4, buffer_f32);
        var vz = buffer_peek(smooth_buff, i + 8, buffer_f32);

        var key = stringify_coordinates(vx, vy, vz, 8);
        var normal = struct_get(vertex_normals, key);

        // Debugging the fetched normal for each vertex
        show_debug_message("Vertex: " + key + " fetched normal: " + string(normal));

        // Normalize the final normal
        var length = sqrt(normal[0] * normal[0] + normal[1] * normal[1] + normal[2] * normal[2]);
        if (length > epsilon) {
            normal[0] /= length;
            normal[1] /= length;
            normal[2] /= length;
        } else {
            normal = [0, 0, 0];
        }

        // Debugging the final normalized normal
        show_debug_message("Normalized normal for vertex: " + key + " is: " + string(normal));

        // Assign normal to the vertex
        buffer_poke(smooth_buff, i + 12, buffer_f32, normal[0]);
        buffer_poke(smooth_buff, i + 16, buffer_f32, normal[1]);
        buffer_poke(smooth_buff, i + 20, buffer_f32, normal[2]);
    }

    delete vertex_map;
    delete vertex_normals;

    return smooth_buff;
}
