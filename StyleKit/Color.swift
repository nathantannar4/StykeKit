//
//  Color.swift
//  StyleKit
//
//  Copyright © 2017 Nathan Tannar.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//  Created by Nathan Tannar on 2/12/17.
//

import UIKit
import Foundation

public struct Color {

    public struct Default {

        /**
         Overrides the default background colors of navigation views and buttons. Also changes the tint of button, view and toolbar

         - note: The tint color will be adjusted to black or white
         - parameter to: The base color used to set new values
         - returns: Void
        */
        public static func setPrimary(to color: UIColor) {
            Color.Default.Background.NavigationBar = color
            Color.Default.Background.TabBar = color
            Color.Default.Background.Button = color
            Color.Default.Tint.Button = color
            Color.Default.Tint.View = color
            Color.Default.Tint.Toolbar = color
            
            if color.isDark {
                Color.Default.Text.Title = .white
                Color.Default.Text.Subtitle = UIColor.white.darker(by: 5)
            }
            applyChanges()
        }

        /**
         Overrides the default tint colors of navigation views and buttons

         - parameter to: The base color used to set new values
         - returns: Void
        */
        public static func setSecondary(to color: UIColor) {
            Color.Default.Tint.NavigationBar = color
            Color.Default.Tint.TabBar = color
            Color.Default.Tint.Toolbar = color
            Color.Default.Tint.Inactive = color.darker(by: 20)
            Color.Default.Tint.View = color
            Color.Default.Status.Info = color
            applyChanges()
        }

        /**
         Overrides the default background color of button and changes the tint of the toolbar and view to the new color

         - parameter to: The base color used to set new values
         - returns: Void
        */
        public static func setTertiary(to color: UIColor) {
            Color.Default.Background.Button = color
            Color.Default.Tint.View = color
            Color.Default.Status.Info = color
            Color.Default.Tint.Toolbar = color
            applyChanges()
        }

        /**
         Overrides the default background/tint colors of the views and toolbar

         - parameter to: The base color used to set new values
         - returns: Void
        */
        public static func setDetail(to color: UIColor) {
            Color.Default.Tint.View = color
            Color.Default.Tint.Toolbar = color
            applyChanges()
        }
        
        internal static func applyChanges() {
            customizeView()
            customizeImageView()
            customizeTableView()
            customizeNavigationBar()
            customizeTabBar()
            customizeButton()
            customizeSwitch()
            customizeSearchBar()
            customizeSegmentedControl()
            customizeSlider()
            customizeToolbar()
            customizePageControl()
        }

        /**
         Overrides the default shadow properties view

         - parameter color: The color of the shadow, defaults to Color.Gray.P600
         - parameter opacity: The opacity of the shadow, defaults to 0.3
         - parameter radius: The radius of the shadow, defaults to 3
         - paramter offset: The offset of the shadow, defaults to CGSize(width: 0, height: 2)
         - returns: Void
        */
        public static func setShadow(color: UIColor = Color.Gray.P500, opacity: Float = 0.3, radius: CGFloat = 3, offset: CGSize = CGSize(width: 0, height: 2)) {
            Color.Default.Shadow.cgColor = color.cgColor
            Color.Default.Shadow.Opacity = opacity
            Color.Default.Shadow.Radius = radius
            Color.Default.Shadow.Offset = offset
        }
        
        
        /// Sets the default shadow to a more standard flat look
        public static func setCleanShadow() {
            setShadow(color: Color.Gray.P500, opacity: 1, radius: 1, offset: .zero)
        }
        
        /// Sets the default shadow to transparent
        public static func setNoShadow() {
            setShadow(color: .clear, opacity: 0, radius: 0, offset: .zero)
        }

        public struct Tint {
            public static var View          =  UIColor.lightBlue
            public static var Button        =  UIColor.lightBlue
            public static var NavigationBar =  UIColor.lightBlue
            public static var TabBar        =  UIColor.lightBlue
            public static var Toolbar       =  UIColor.lightBlue
            public static var Inactive      =  Color.Gray.P500
        }

        public struct Background {
            public static var View             =  Color.White
            public static var ViewController   =  UIColor(hex: "EFEFF4")
            public static var Button           =  Color.White
            public static var NavigationBar    =  Color.White
            public static var TabBar           =  Color.White
            public static var Toolbar          =  Color.White
        }

        public struct Text {
            public static var Title     = Color.Gray.P900
            public static var Subtitle  = Color.Gray.P800
            public static var Body      = UIColor(hex: "#333333")
            public static var Callout   = UIColor(hex: "#333333")
            public static var Caption   = UIColor(hex: "#333333")
            public static var Footnote  = UIColor(hex: "#333333")
            public static var Headline  = UIColor(hex: "#333333")
            public static var Subhead   = UIColor(hex: "#8E8E8E")
            public static var Disabled  = Color.Gray.P500
        }

        public struct Status {
            public static var Info    = UIColor.lightBlue
            public static var Success = UIColor(hex: "#37D387")
            public static var Warning = Color.Orange.P800.lighter(by: 10)
            public static var Danger  = UIColor(hex: "#FF6E6E")
        }
        
        public struct Shadow {
            public static var cgColor: CGColor = Color.Gray.P600.cgColor
            public static var Opacity: Float   = 0.3
            public static var Radius:  CGFloat = 3
            public static var Offset: CGSize   = CGSize(width: 0, height: 2)
        }
        
        // UIView
        public static func customizeView(backgroundColor: UIColor = Color.Default.Background.View,
                                         tintColor: UIColor = Color.Default.Tint.View) {
            UIView.appearance().backgroundColor = backgroundColor
            UIView.appearance().tintColor = tintColor
        }
        
        // UIImageView
        public static func customizeImageView(backgroundColor: UIColor = Color.Default.Background.View,
                                         tintColor: UIColor = Color.Default.Tint.View) {
            UIImageView.appearance().backgroundColor = backgroundColor
            UIImageView.appearance().tintColor = tintColor
        }
        
        // UITableView
        public static func customizeTableView(backgroundColor: UIColor = Color.Default.Background.View,
                                              tintColor: UIColor = Color.Default.Tint.View) {
            
            UITableView.appearance().tintColor = tintColor
            UITableView.appearance().backgroundColor = backgroundColor
        }
        
        // UINavigationBar
        public static func customizeNavigationBar(barColor: UIColor = Color.Default.Background.NavigationBar,
                                                  textColor: UIColor = Color.Default.Text.Title,
                                                  font: UIFont = Font.Default.Title,
                                                  buttonTint: UIColor = Color.Default.Tint.NavigationBar) {
            
            UINavigationBar.appearance().barTintColor = barColor
            UINavigationBar.appearance().tintColor = buttonTint
            UINavigationBar.appearance().backgroundColor = barColor
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: textColor, NSFontAttributeName: font.fontName]
            UINavigationBar.appearance().layer.shadowColor = Color.Default.Shadow.cgColor
            UINavigationBar.appearance().layer.shadowOffset = Color.Default.Shadow.Offset
            UINavigationBar.appearance().layer.shadowOpacity = Color.Default.Shadow.Opacity
            UINavigationBar.appearance().layer.shadowRadius = Color.Default.Shadow.Radius
        }
        
        // UITabBar
        public static func customizeTabBar(barColor: UIColor = Color.Default.Background.TabBar,
                                           tintColor: UIColor = Color.Default.Tint.TabBar,
                                           font: UIFont = Font.Default.Subtitle) {
            
            UITabBar.appearance().barTintColor = barColor
            UITabBar.appearance().tintColor = tintColor
            UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: font.fontName], for: .normal)
        }
        
        // UIButton
        public static func customizeButton(backgroundColor: UIColor = Color.Default.Background.Button,
                                           tintColor: UIColor = Color.Default.Tint.Button,
                                           font: UIFont = Font.Default.Body) {
            
            UIButton.appearance().backgroundColor = backgroundColor
            UIButton.appearance().tintColor = tintColor
            UIButton.appearance().setTitleColor(backgroundColor.isLight ? .black : .white, for: .normal)
        }
        
        // UISwitch
        public static func customizeSwitch(onTintColor: UIColor = Color.Default.Tint.View) {
            
            UISwitch.appearance().onTintColor = onTintColor
        }
        
        // UISearchBar
        public static func customizeSearchBar(barColor: UIColor = Color.Default.Background.View, tintColor: UIColor = Color.Default.Tint.View) {
            
            UISearchBar.appearance().barTintColor = barColor
            UISearchBar.appearance().tintColor = barColor
        }
        
        // UISegmentedControl
        public static func customizeSegmentedControl(backgroundColor: UIColor = Color.Default.Background.NavigationBar,
                                                     tintColor: UIColor = Color.Default.Tint.NavigationBar,
                                                     font: UIFont = Font.Default.Body) {
            
            UISegmentedControl.appearance().backgroundColor = backgroundColor
            UISegmentedControl.appearance().tintColor = tintColor
            UISegmentedControl.appearance().setTitleTextAttributes([NSFontAttributeName: font.familyName], for: .normal)
        }
        
        // UISlider
        public static func customizeSlider(minimumTrackTintColor: UIColor = Color.Default.Tint.View) {
            
            UISlider.appearance().minimumTrackTintColor = minimumTrackTintColor
        }
        
        // UIToolbar
        public static func customizeToolbar(backgroundColor: UIColor = Color.Default.Background.Toolbar,
                                            tintColor: UIColor = Color.Default.Tint.Toolbar) {
            
            UIToolbar.appearance().tintColor = tintColor
            UIToolbar.appearance().backgroundColor = backgroundColor
        }
        
        
        // UIPageControl
        public static func customizePageControl(currentPageTintColor: UIColor = Color.Default.Tint.View) {
            
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
            UIPageControl.appearance().currentPageIndicatorTintColor = currentPageTintColor
            UIPageControl.appearance().backgroundColor = UIColor.clear
        }
    }

    public static let FacebookBlue = UIColor(hex: "#3b5998")
    public static let TwitterBlue  = UIColor(hex: "#00aced")
    public static let LinkedInBlue = UIColor(hex: "#0077b5")

    
    // Google's Material Design Color Palette
    
    
    /// GMD Red
    public struct Red {
        public static let P50	= UIColor(rgba: 0xFDE0DCFF)
        public static let P100	= UIColor(rgba: 0xF9BDBBFF)
        public static let P200	= UIColor(rgba: 0xF69988FF)
        public static let P300	= UIColor(rgba: 0xF36C60FF)
        public static let P400	= UIColor(rgba: 0xE84E40FF)
        public static let P500	= UIColor(rgba: 0xE51C23FF)
        public static let P600	= UIColor(rgba: 0xDD191DFF)
        public static let P700	= UIColor(rgba: 0xD01716FF)
        public static let P800	= UIColor(rgba: 0xC41411FF)
        public static let P900	= UIColor(rgba: 0xB0120AFF)
        public static let A100	= UIColor(rgba: 0xFF7997FF)
        public static let A200	= UIColor(rgba: 0xFF5177FF)
        public static let A400	= UIColor(rgba: 0xFF2D6FFF)
        public static let A700	= UIColor(rgba: 0xE00032FF)
    }
    
    /// GMD Pink
    public struct Pink {
        public static let P50	= UIColor(rgba: 0xFCE4ECFF)
        public static let P100	= UIColor(rgba: 0xF8BBD0FF)
        public static let P200	= UIColor(rgba: 0xF48FB1FF)
        public static let P300	= UIColor(rgba: 0xF06292FF)
        public static let P400	= UIColor(rgba: 0xEC407AFF)
        public static let P500	= UIColor(rgba: 0xE91E63FF)
        public static let P600	= UIColor(rgba: 0xD81B60FF)
        public static let P700	= UIColor(rgba: 0xC2185BFF)
        public static let P800	= UIColor(rgba: 0xAD1457FF)
        public static let P900	= UIColor(rgba: 0x880E4FFF)
        public static let A100	= UIColor(rgba: 0xFF80ABFF)
        public static let A200	= UIColor(rgba: 0xFF4081FF)
        public static let A400	= UIColor(rgba: 0xF50057FF)
        public static let A700	= UIColor(rgba: 0xC51162FF)
    }
    
    /// GMD Purple
    public struct Purple {
        public static let P50	= UIColor(rgba: 0xF3E5F5FF)
        public static let P100	= UIColor(rgba: 0xE1BEE7FF)
        public static let P200	= UIColor(rgba: 0xCE93D8FF)
        public static let P300	= UIColor(rgba: 0xBA68C8FF)
        public static let P400	= UIColor(rgba: 0xAB47BCFF)
        public static let P500	= UIColor(rgba: 0x9C27B0FF)
        public static let P600	= UIColor(rgba: 0x8E24AAFF)
        public static let P700	= UIColor(rgba: 0x7B1FA2FF)
        public static let P800	= UIColor(rgba: 0x6A1B9AFF)
        public static let P900	= UIColor(rgba: 0x4A148CFF)
        public static let A100	= UIColor(rgba: 0xEA80FCFF)
        public static let A200	= UIColor(rgba: 0xE040FBFF)
        public static let A400	= UIColor(rgba: 0xD500F9FF)
        public static let A700	= UIColor(rgba: 0xAA00FFFF)
    }

    /// GMD Deep Purple
    public struct DeepPurple {
        public static let P50  	= UIColor(rgba: 0xEDE7F6FF)
        public static let P100	= UIColor(rgba: 0xD1C4E9FF)
        public static let P200	= UIColor(rgba: 0xB39DDBFF)
        public static let P300	= UIColor(rgba: 0x9575CDFF)
        public static let P400	= UIColor(rgba: 0x7E57C2FF)
        public static let P500	= UIColor(rgba: 0x673AB7FF)
        public static let P600	= UIColor(rgba: 0x5E35B1FF)
        public static let P700	= UIColor(rgba: 0x512DA8FF)
        public static let P800	= UIColor(rgba: 0x4527A0FF)
        public static let P900	= UIColor(rgba: 0x311B92FF)
        public static let A100	= UIColor(rgba: 0xB388FFFF)
        public static let A200	= UIColor(rgba: 0x7C4DFFFF)
        public static let A400	= UIColor(rgba: 0x651FFFFF)
        public static let A700	= UIColor(rgba: 0x6200EAFF)
    }
    
    /// GMD Indigo
    public struct Indigo {
        public static let P50   = UIColor(rgba: 0xE8EAF6FF)
        public static let P100	= UIColor(rgba: 0xC5CAE9FF)
        public static let P200	= UIColor(rgba: 0x9FA8DAFF)
        public static let P300	= UIColor(rgba: 0x7986CBFF)
        public static let P400	= UIColor(rgba: 0x5C6BC0FF)
        public static let P500	= UIColor(rgba: 0x3F51B5FF)
        public static let P600	= UIColor(rgba: 0x3949ABFF)
        public static let P700	= UIColor(rgba: 0x303F9FFF)
        public static let P800	= UIColor(rgba: 0x283593FF)
        public static let P900	= UIColor(rgba: 0x1A237EFF)
        public static let A100	= UIColor(rgba: 0x8C9EFFFF)
        public static let A200	= UIColor(rgba: 0x536DFEFF)
        public static let A400	= UIColor(rgba: 0x3D5AFEFF)
        public static let A700	= UIColor(rgba: 0x304FFEFF)
    }

    /// GMD Blue
    public struct Blue {
        public static let P50	= UIColor(rgba: 0xE7E9FDFF)
        public static let P100	= UIColor(rgba: 0xD0D9FFFF)
        public static let P200	= UIColor(rgba: 0xAFBFFFFF)
        public static let P300	= UIColor(rgba: 0x91A7FFFF)
        public static let P400	= UIColor(rgba: 0x738FFEFF)
        public static let P500	= UIColor(rgba: 0x5677FCFF)
        public static let P600	= UIColor(rgba: 0x4E6CEFFF)
        public static let P700	= UIColor(rgba: 0x455EDEFF)
        public static let P800	= UIColor(rgba: 0x3B50CEFF)
        public static let P900	= UIColor(rgba: 0x2A36B1FF)
        public static let A100	= UIColor(rgba: 0xA6BAFFFF)
        public static let A200	= UIColor(rgba: 0x6889FFFF)
        public static let A400	= UIColor(rgba: 0x4D73FFFF)
        public static let A700	= UIColor(rgba: 0x4D69FFFF)
    }

    /// GMD Light Blue
    public struct LightBlue {
        public static let P50   = UIColor(rgba: 0xE1F5FEFF)
        public static let P100	= UIColor(rgba: 0xB3E5FCFF)
        public static let P200	= UIColor(rgba: 0x81D4FAFF)
        public static let P300	= UIColor(rgba: 0x4FC3F7FF)
        public static let P400	= UIColor(rgba: 0x29B6F6FF)
        public static let P500	= UIColor(rgba: 0x03A9F4FF)
        public static let P600	= UIColor(rgba: 0x039BE5FF)
        public static let P700	= UIColor(rgba: 0x0288D1FF)
        public static let P800	= UIColor(rgba: 0x0277BDFF)
        public static let P900	= UIColor(rgba: 0x01579BFF)
        public static let A100	= UIColor(rgba: 0x80D8FFFF)
        public static let A200	= UIColor(rgba: 0x40C4FFFF)
        public static let A400	= UIColor(rgba: 0x00B0FFFF)
        public static let A700	= UIColor(rgba: 0x0091EAFF)
    }

    /// GMD Cyan
    public struct Cyan {
        public static let P50	= UIColor(rgba: 0xE0F7FAFF)
        public static let P100	= UIColor(rgba: 0xB2EBF2FF)
        public static let P200	= UIColor(rgba: 0x80DEEAFF)
        public static let P300	= UIColor(rgba: 0x4DD0E1FF)
        public static let P400	= UIColor(rgba: 0x26C6DAFF)
        public static let P500	= UIColor(rgba: 0x00BCD4FF)
        public static let P600	= UIColor(rgba: 0x00ACC1FF)
        public static let P700	= UIColor(rgba: 0x0097A7FF)
        public static let P800	= UIColor(rgba: 0x00838FFF)
        public static let P900	= UIColor(rgba: 0x006064FF)
        public static let A100	= UIColor(rgba: 0x84FFFFFF)
        public static let A200	= UIColor(rgba: 0x18FFFFFF)
        public static let A400	= UIColor(rgba: 0x00E5FFFF)
        public static let A700	= UIColor(rgba: 0x00B8D4FF)
    }

    /// GMD Teal
    public struct Teal {
        public static let P50  	= UIColor(rgba: 0xE0F2F1FF)
        public static let P100	= UIColor(rgba: 0xB2DFDBFF)
        public static let P200	= UIColor(rgba: 0x80CBC4FF)
        public static let P300	= UIColor(rgba: 0x4DB6ACFF)
        public static let P400	= UIColor(rgba: 0x26A69AFF)
        public static let P500	= UIColor(rgba: 0x009688FF)
        public static let P600	= UIColor(rgba: 0x00897BFF)
        public static let P700	= UIColor(rgba: 0x00796BFF)
        public static let P800	= UIColor(rgba: 0x00695CFF)
        public static let P900	= UIColor(rgba: 0x004D40FF)
        public static let A100	= UIColor(rgba: 0xA7FFEBFF)
        public static let A200	= UIColor(rgba: 0x64FFDAFF)
        public static let A400	= UIColor(rgba: 0x1DE9B6FF)
        public static let A700	= UIColor(rgba: 0x00BFA5FF)
    }

    /// GMD Green
    public struct Green {
        public static let P50	= UIColor(rgba: 0xD0F8CEFF)
        public static let P100	= UIColor(rgba: 0xA3E9A4FF)
        public static let P200	= UIColor(rgba: 0x72D572FF)
        public static let P300	= UIColor(rgba: 0x42BD41FF)
        public static let P400	= UIColor(rgba: 0x2BAF2BFF)
        public static let P500	= UIColor(rgba: 0x259B24FF)
        public static let P600	= UIColor(rgba: 0x0A8F08FF)
        public static let P700	= UIColor(rgba: 0x0A7E07FF)
        public static let P800	= UIColor(rgba: 0x056F00FF)
        public static let P900	= UIColor(rgba: 0x0D5302FF)
        public static let A100	= UIColor(rgba: 0xA2F78DFF)
        public static let A200	= UIColor(rgba: 0x5AF158FF)
        public static let A400	= UIColor(rgba: 0x14E715FF)
        public static let A700	= UIColor(rgba: 0x12C700FF)
    }

    /// GMD Light Green
    public struct LightGreen {
        public static let P50  	= UIColor(rgba: 0xF1F8E9FF)
        public static let P100	= UIColor(rgba: 0xDCEDC8FF)
        public static let P200	= UIColor(rgba: 0xC5E1A5FF)
        public static let P300	= UIColor(rgba: 0xAED581FF)
        public static let P400	= UIColor(rgba: 0x9CCC65FF)
        public static let P500	= UIColor(rgba: 0x8BC34AFF)
        public static let P600	= UIColor(rgba: 0x7CB342FF)
        public static let P700	= UIColor(rgba: 0x689F38FF)
        public static let P800	= UIColor(rgba: 0x558B2FFF)
        public static let P900	= UIColor(rgba: 0x33691EFF)
        public static let A100	= UIColor(rgba: 0xCCFF90FF)
        public static let A200	= UIColor(rgba: 0xB2FF59FF)
        public static let A400	= UIColor(rgba: 0x76FF03FF)
        public static let A700	= UIColor(rgba: 0x64DD17FF)
    }

    /// GMD Lime
    public struct Lime {
        public static let P50 	= UIColor(rgba: 0xF9FBE7FF)
        public static let P100	= UIColor(rgba: 0xF0F4C3FF)
        public static let P200	= UIColor(rgba: 0xE6EE9CFF)
        public static let P300	= UIColor(rgba: 0xDCE775FF)
        public static let P400	= UIColor(rgba: 0xD4E157FF)
        public static let P500	= UIColor(rgba: 0xCDDC39FF)
        public static let P600	= UIColor(rgba: 0xC0CA33FF)
        public static let P700	= UIColor(rgba: 0xAFB42BFF)
        public static let P800	= UIColor(rgba: 0x9E9D24FF)
        public static let P900	= UIColor(rgba: 0x827717FF)
        public static let A100	= UIColor(rgba: 0xF4FF81FF)
        public static let A200	= UIColor(rgba: 0xEEFF41FF)
        public static let A400	= UIColor(rgba: 0xC6FF00FF)
        public static let A700	= UIColor(rgba: 0xAEEA00FF)
    }

    /// GMD Yello
    public struct Yellow {
        public static let P50 	= UIColor(rgba: 0xFFFDE7FF)
        public static let P100	= UIColor(rgba: 0xFFF9C4FF)
        public static let P200	= UIColor(rgba: 0xFFF59DFF)
        public static let P300	= UIColor(rgba: 0xFFF176FF)
        public static let P400	= UIColor(rgba: 0xFFEE58FF)
        public static let P500	= UIColor(rgba: 0xFFEB3BFF)
        public static let P600	= UIColor(rgba: 0xFDD835FF)
        public static let P700	= UIColor(rgba: 0xFBC02DFF)
        public static let P800	= UIColor(rgba: 0xF9A825FF)
        public static let P900	= UIColor(rgba: 0xF57F17FF)
        public static let A100	= UIColor(rgba: 0xFFFF8DFF)
        public static let A200	= UIColor(rgba: 0xFFFF00FF)
        public static let A400	= UIColor(rgba: 0xFFEA00FF)
        public static let A700	= UIColor(rgba: 0xFFD600FF)
    }

    /// GMD Amber
    public struct Amber {
        public static let P50 	= UIColor(rgba: 0xFFF8E1FF)
        public static let P100	= UIColor(rgba: 0xFFECB3FF)
        public static let P200	= UIColor(rgba: 0xFFE082FF)
        public static let P300	= UIColor(rgba: 0xFFD54FFF)
        public static let P400	= UIColor(rgba: 0xFFCA28FF)
        public static let P500	= UIColor(rgba: 0xFFC107FF)
        public static let P600	= UIColor(rgba: 0xFFB300FF)
        public static let P700	= UIColor(rgba: 0xFFA000FF)
        public static let P800	= UIColor(rgba: 0xFF8F00FF)
        public static let P900	= UIColor(rgba: 0xFF6F00FF)
        public static let A100	= UIColor(rgba: 0xFFE57FFF)
        public static let A200	= UIColor(rgba: 0xFFD740FF)
        public static let A400	= UIColor(rgba: 0xFFC400FF)
        public static let A700	= UIColor(rgba: 0xFFAB00FF)
    }

    /// GMD Orange
    public struct Orange {
        public static let P50 	= UIColor(rgba: 0xFFF3E0FF)
        public static let P100	= UIColor(rgba: 0xFFE0B2FF)
        public static let P200	= UIColor(rgba: 0xFFCC80FF)
        public static let P300	= UIColor(rgba: 0xFFB74DFF)
        public static let P400	= UIColor(rgba: 0xFFA726FF)
        public static let P500	= UIColor(rgba: 0xFF9800FF)
        public static let P600	= UIColor(rgba: 0xFB8C00FF)
        public static let P700	= UIColor(rgba: 0xF57C00FF)
        public static let P800	= UIColor(rgba: 0xEF6C00FF)
        public static let P900	= UIColor(rgba: 0xE65100FF)
        public static let A100	= UIColor(rgba: 0xFFD180FF)
        public static let A200	= UIColor(rgba: 0xFFAB40FF)
        public static let A400	= UIColor(rgba: 0xFF9100FF)
        public static let A700	= UIColor(rgba: 0xFF6D00FF)
    }

    /// GMD Deep Orange
    public struct DeepOrange {
        public static let P50 	= UIColor(rgba: 0xFBE9E7FF)
        public static let P100	= UIColor(rgba: 0xFFCCBCFF)
        public static let P200	= UIColor(rgba: 0xFFAB91FF)
        public static let P300	= UIColor(rgba: 0xFF8A65FF)
        public static let P400	= UIColor(rgba: 0xFF7043FF)
        public static let P500	= UIColor(rgba: 0xFF5722FF)
        public static let P600	= UIColor(rgba: 0xF4511EFF)
        public static let P700	= UIColor(rgba: 0xE64A19FF)
        public static let P800	= UIColor(rgba: 0xD84315FF)
        public static let P900	= UIColor(rgba: 0xBF360CFF)
        public static let A100	= UIColor(rgba: 0xFF9E80FF)
        public static let A200	= UIColor(rgba: 0xFF6E40FF)
        public static let A400	= UIColor(rgba: 0xFF3D00FF)
        public static let A700	= UIColor(rgba: 0xDD2C00FF)
    }

    /// GMD Brown
    public struct Brown {
        public static let P50 	= UIColor(rgba: 0xEFEBE9FF)
        public static let P100	= UIColor(rgba: 0xD7CCC8FF)
        public static let P200	= UIColor(rgba: 0xBCAAA4FF)
        public static let P300	= UIColor(rgba: 0xA1887FFF)
        public static let P400	= UIColor(rgba: 0x8D6E63FF)
        public static let P500	= UIColor(rgba: 0x795548FF)
        public static let P600	= UIColor(rgba: 0x6D4C41FF)
        public static let P700	= UIColor(rgba: 0x5D4037FF)
        public static let P800	= UIColor(rgba: 0x4E342EFF)
        public static let P900	= UIColor(rgba: 0x3E2723FF)
    }

    /// GMD Gray
    public struct Gray {
        public static let P0	= UIColor(rgba: 0xFFFFFFFF)
        public static let P50	= UIColor(rgba: 0xFAFAFAFF)
        public static let P100	= UIColor(rgba: 0xF5F5F5FF)
        public static let P200	= UIColor(rgba: 0xEEEEEEFF)
        public static let P300	= UIColor(rgba: 0xE0E0E0FF)
        public static let P400	= UIColor(rgba: 0xBDBDBDFF)
        public static let P500	= UIColor(rgba: 0x9E9E9EFF)
        public static let P600	= UIColor(rgba: 0x757575FF)
        public static let P700	= UIColor(rgba: 0x616161FF)
        public static let P800	= UIColor(rgba: 0x424242FF)
        public static let P900	= UIColor(rgba: 0x212121FF)
        public static let P1000 = UIColor(rgba: 0x000000FF)
    }

    /// GMD Blue Gray
    public struct BlueGray {
        public static let P50 	= UIColor(rgba: 0xECEFF1FF)
        public static let P100	= UIColor(rgba: 0xCFD8DCFF)
        public static let P200	= UIColor(rgba: 0xB0BEC5FF)
        public static let P300	= UIColor(rgba: 0x90A4AEFF)
        public static let P400	= UIColor(rgba: 0x78909CFF)
        public static let P500	= UIColor(rgba: 0x607D8BFF)
        public static let P600	= UIColor(rgba: 0x546E7AFF)
        public static let P700	= UIColor(rgba: 0x455A64FF)
        public static let P800	= UIColor(rgba: 0x37474FFF)
        public static let P900	= UIColor(rgba: 0x263238FF)
    }

    
    /// Pure Black
    public static let Black = UIColor(hex: "000000")
    
    /// Pure White
    public static let White = UIColor(hex: "FFFFFF")
}
