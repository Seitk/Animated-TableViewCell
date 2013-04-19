Animated-TableViewCell
==================

A example project with Animated Cells

In this example, I created a customCell1 which demonstrate that how the animated call user to subclass and customize their own tableViewCell. Add everything into the atcContentView in cell, configue it's height then you can use the defined animated. Animated Cell provides push animation from 4 directions and pop out animation. See function interface below:

Function  
\- (void) resetPosition;  
\- (void) configureCellContentSizeWidth:(float) width height:(float)height;  
  
\- (void) pushCellWithAnimation:(bool)animated;  
\- (void) pushCellWithAnimation:(bool)animated direction:(NSString *)direction;  
\- (void) pushCellWithAnimation:(bool)animated duration:(float)duration;  
\- (void) pushCellWithAnimation:(bool)animated duration:(float)duration direction:(NSString *)direction;  
  
\- (void) popCellWithAnimation:(bool)animated;  
\- (void) popCellWithAnimation:(bool)animated duration:(float)duration;

![ScreenShot](https://github.com/Seitk/Animated-TableViewCell/blob/master/Animated%20Table/screenshot1.png?raw=true) &nbsp; ![ScreenShot](https://github.com/Seitk/Animated-TableViewCell/blob/master/Animated%20Table/screenshot2.png?raw=true)

Contribute  
I'd love to include your contributions. Feel free to improve it, send comments or suggestions. Please let me know if you have great idea on it.

Contact Me  
You can add me on Facebook - http://www.facebook.com/seitkk
