enum DiagonalMovement {
  /// Only allow vertical and horizontal movement
  /// ```
  ///       3  2  3  
  ///    3  2  1  2  3 
  ///    2  1  🎠 1  2 
  ///    3  2  1  2  3 
  ///       3  2  3    
  /// ```
  manhattan,

  /// Allow vertical, horizontal, and diagonal movement
  euclidean,

  /// https://en.wikipedia.org/wiki/Chebyshev_distance
  /// ``` 
  ///    2  2  2  2  2 
  ///    2  1  1  1  2  
  ///    2  1  🎠 1  2 
  ///    2  1  1  1  2 
  ///    2  2  2  2  2 
  /// ```
  chebushev,


  /// Allow only diagonal movement
  
}
