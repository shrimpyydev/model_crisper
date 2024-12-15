function value_wrap(v1, vmin, vmax) {
    // Calculate the range size
   
   
   var range = vmax - vmin;
    
    // Wrap v1 using modulo to map it within the range
   
   return ((v1 - vmin) mod range + range) mod range + vmin;
}