# ACTheme
A library for creating an application theme, as well as for changing it on the fly.

[![version](https://img.shields.io/badge/version-0.0.1-white.svg)](https://semver.org)

## Requirements
* IOS 11 or above
* Xcode 12.5 or above

## Overview
[How to work with it ](#How-to-work-with-it )\
[Install](#Install)\
[License](#License)\
[Author](#MVAuthorVM)

## How to work with it
First you need to create an entity for the application theme:

```swift
public enum AppTheme: String {
    case light = "light"
    case dark = "dark"
    case red = "red"
    case gray = "gray"
}

// MARK: - ACThemeProtocol
extension AppTheme: ACThemeProtocol {
    public typealias ThemeSettings = Settings
    
    public struct Settings: ACThemeSettingsProtocol {
        let bgColor: UIColor
        let textColor: UIColor
        let cardColor: UIColor
        let tintColor: UIColor
        let barStyle: UIBarStyle
    }
    
    public var settings: Settings {
        switch self {
        case .light:
            return Settings(
                bgColor: .white,
                textColor: .black,
                cardColor: .lightGray,
                tintColor: .blue,
                barStyle: .default
            )
        case .dark:
            return Settings(
                bgColor: .black,
                textColor: .white,
                cardColor: .gray,
                tintColor: .white,
                barStyle: .black
            )
        case .red:
            return Settings(
                bgColor: .white,
                textColor: .red,
                cardColor: UIColor.red.withAlphaComponent(0.5),
                tintColor: .red,
                barStyle: .default
            )
        case .gray:
            return Settings(
                bgColor: .lightGray,
                textColor: .white,
                cardColor: .gray,
                tintColor: .black,
                barStyle: .default
            )
        }
    }
}
```

Then create a manager:
```swift
class AppThemeManager: ACThemeManager<AppTheme> {
    static var shared = AppThemeManager()
}
```
And finally create extensions for thematic types. For example, for all `NSObject` at once:

```swift
extension NSObject: ACThemableManageable {
    public typealias Theme = AppTheme
    
    public var themeManager: ACThemeManager<AppTheme> {
        AppThemeManager.shared
    }
}
```

Now you can use adding a theme in your code:

```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.applyTheme { view, settings in
            view.backgroundColor = settings.bgColor
        }
    }
   
    ...
    
}

class TableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let result = UILabel()
        result.numberOfLines = 0
        result.applyTheme { view, settings in
            view.textColor = settings.textColor
        }
        
        return result
    }()
    
    lazy var cardView: UIView = {
        let result = UIView()
        result.layer.cornerRadius = 16
        result.applyTheme { view, settings in
            view.backgroundColor = settings.cardColor
        }
        
        return result
    }()

    ...
    
}
```

Details can be found in the [Demo](https://github.com/AppCraftTeam/appcraft-theme-ios/tree/main/Demo/ACThemeDemo).

## Install
Swift Package Manager(SPM) is Apple's dependency manager tool. It is now supported in Xcode 11. So it can be used in all appleOS types of projects. It can be used alongside other tools like CocoaPods and Carthage as well.

### Install package into your packages
Add a reference and a targeting release version in the dependencies section in Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "<your_project_name>",
    products: [],
    dependencies: [
        .package(url: "https://github.com/AppCraftTeam/appcraft-theme-ios.git", from: "<current_version>")
    ]
)
```

### Install package via Xcode
1. Go to `File` -> `Swift Packages` -> `Add Package Dependency...`
2. Then search for <https://github.com/AppCraftTeam/appcraft-theme-ios.git>
3. And choose the version you want

## License
Distributed under the MIT License.

## Author
Email: <dmitriyap11@gmail.com>
