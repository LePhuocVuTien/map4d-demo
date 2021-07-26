import UIKit

extension UIFont {
  public static func registerCustomFonts() {
    [
      R.file.openSansBoldTtf,
      R.file.openSansRegularTtf,
      R.file.openSansSemiBoldTtf
    ]
    .compactMap { $0.url() }
    .forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
  }
}
