import SwiftUI

extension Font {

    static var fontName: String = "";
    
    static func futuraMedium(size: CGFloat) -> Font {
        return Font.custom(fontName, size: size)
    }
}
