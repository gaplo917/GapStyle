# Gap-Style Theme For IntelliJ & XCode
GapStyle is a ***productivity-oriented*** and ***experience-driven*** designed color scheme with a [list of supported languages](#actively-maintain-language). Each supported language is tailor made and carefully tuned with [rationale](#gapstyle-specification).

The first draft of GapStyle was created on 2014 in PhpStorm 8. After that, Gap have spent 10,000+ hours of using GapStyle scheme and at least 500+ hours of A/B testing, tuning and stablizing throughout the years. 

So, GapStyle is a unique and opinionated color scheme that has converged Gap's 5+ years of software development experience (learning, reading and writing on various programming languages) into productivity-oriented syntax hightlight GapStyle specification.

### Objectives
* Optimize languages' color schemes to boost productivity on reading/writing code (Especially the language your are not familiar)
* Quickly learn similar syntax with a universal designed color across different languages
* Spot syntax error before IDE inspection

Table of Contents
=================
* [GapStyle Specification](#gapstyle-specification)
  * [Recommended Font](#recommended-font)
  * [Color Palette](#color-palette)
  * [Special Styling](#special-styling)
  * [Special File Type](#special-file-type)
* [Installation(IntelliJ)](#installationintellij)
  * [Install from IntelliJ Plugins](#install-from-intellij-plugins)
  * [Install manually](#install-manually)
* [Installation(XCode)](#installationxcode)
* [IntelliJ Enable font ligatures](#intellij-enable-font-ligatures)
* [Actively Maintain Language](#actively-maintain-language)
* [Screenshots](#screenshots)

# GapStyle Specification
GapStyle is designed base on some key color of 'Darcula' and 'Monokai' theme.

### Recommended Font

|Font|Platform|Ligature Support|Description|Action|
|-----|-----|:-----:|-----|:-----:|
|[Hack Ligatured](https://github.com/gaplo917/Ligatured-Hack)|IntelliJ|✅|Hack font that support ligature, built by Gap|[Download](https://github.com/gaplo917/Ligatured-Hack/releases)|
|[Hack](https://github.com/source-foundry/Hack)|IntelliJ|❌|Standard Hack font|[Download](https://github.com/source-foundry/Hack/releases) |
|[Meslo LG DZ](https://github.com/andreberg/Meslo-Font)|Xcode|❌|Solve Xcode no line-spacing settings|[Download](https://github.com/andreberg/Meslo-Font/releases) |

### Color Palette
| Syntax | Theme | Color | Philosophy |
|-------------------------|-------------------------|:-------------------------:|-------------------------|
|Default|Darcula|![](https://placehold.it/15/A9B7C6/000000?text=+)| Monokai's default pure white color is too high contrast |
|Keyword|Monokai|![](https://placehold.it/15/F92672/000000?text=+)| |
|String|Monokai|![](https://placehold.it/15/E6DB74/000000?text=+)| |
|Number|Monokai|![](https://placehold.it/15/AE81FF/000000?text=+)| |
|Class, Struct|Monokai| ![](https://placehold.it/15/66D9EF/000000?text=+)| |
|Abstract Class|Derived from **Class**| ![](https://placehold.it/15/66D9EF/000000?text=+)|always affinitive to **Class**. Should be distinguished from **Class** but not too eye-catching. To remain overall harmony, just add slightly green on ![](https://placehold.it/15/66D9EF/000000?text=+) |
|Interface, Protocol|Derived from **Abstract Class**| ![](https://placehold.it/15/0ED38C/000000?text=+)|should be distinguished easily from **Class/Abstract Class** but also should keep 'claim' with them. Add more green on ![](https://placehold.it/15/66D9EF/000000?text=+)|
|Method|Monokai| ![](https://placehold.it/15/A6E22E/000000?text=+)| |
|Parameter|Darcula|![](https://placehold.it/15/FD971F/000000?text=+)| |
|Local variable|Derived from **Parameter**|![](https://placehold.it/15/CBAD96/000000?text=+)|always affinitive to **Parameter**. Should be distinguished from **Parameter** but not too eye-catching. To remain overall harmony, just substract some orange on ![](https://placehold.it/15/FD971F/000000?text=+)|
|Annotation|Darcula|![](https://placehold.it/15/BBB529/000000?text=+)| |
|Comment|Darcula|![](https://placehold.it/15/808080/000000?text=+)| |
|Doc|Darcula|![](https://placehold.it/15/629755/000000?text=+)| should be distinguished from **Comment** and **String** |
|Enum, Constant|Custom|![](https://placehold.it/15/4186F8/000000?text=+)| should be distinguished easily from **Parameter**, **Local variable**, **String**, **Number**  |
|Typealias, Generic Type|Custom|![](https://placehold.it/15/507874/000000?text=+)|should be distinguished easily from **Interface/Class/Abstract Class**|

### Special Styling
| Syntax | Style | Philosophy |
|-------------------------|-------------------------|-------------------------|
|Keyword|**Bold**|Bold to standout and outweight the importance|
|Singleton|**Bold**|preserve same color but also should be distinguished easily from non-singleton object|
|Global/Static variable|***Italic + Bold***|preserve same color but also should be distinguished easily from **Parameter** and **Local variable**|
|Smart cast|![](https://placehold.it/15/2F4830/000000?text=+) (background color)|should be distinguishable easily|
|Invalid Expression|![](https://placehold.it/15/FF0000/000000?text=+) (underwaved line)|Inherited from Darcula|
|Reassigned Variable|underscored|Inherited from Darcula|

### Special File Type
| File | Theme | Philosophy |
|-------------------------|-------------------------|-------------------------|
|XML|Darcula|NOT to use HTML-like highlighting because IntelliJ use XML color scheme to highlight JSX's tags internally. Using Darcula original color can prevent from having too much Monokai's **Keyword** color|
|JSON|Derived from **JavaScript**|**Property Key** color should align with **JavaScript** Object|


# Actively Maintain Language
Kotlin, Java, Swift, Scala, Javascript, Go, Python, Android Logcat, Android Native (C / C++), SQL, HTML, CSS, PHP

# Installation(IntelliJ)
### Install from IntelliJ Plugins
1. Preference -> Plugins -> Search 'GapStyle' in Market Place -> install
![](https://cdn.rawgit.com/gaplo917/GapStyle/master/intellij-gapstyle-plugin-tutorial.png)

2. Restart IntelliJ

3. Preference -> Editor -> Color Scheme -> Choose `GapStyle`

### Install manually
1. Download from https://plugins.jetbrains.com/plugin/10559-gapstyle-color-scheme or
`git clone https://github.com/gaplo917/GapStyle`

2. Preference -> Editor -> Color Scheme -> click the settings icon(next to the scheme name) -> import scheme -> select GapStyle.jar

# Installation(XCode)
1. Copy the `xcode/Gap Style.dvtcolortheme` to `~/Library/Developer/Xcode/UserData/FontAndColorThemes`
1. Restart Xcode and you will see the color theme.

# IntelliJ Enable font ligatures
1. Go to 'Preference > Editor > Color Scheme > Color Scheme Font'
1. Check 'Use color scheme font instead of default'
1. Check 'Enable font ligatures'

# Screenshots
| | |
|:-------------------------:|:-------------------------:|
|![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/kotlin.png)  Kotlin (Android Studio / Intellij) | ![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/java.png)  Java (Android Studio / Intellij) |
|![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/swift.png)  Swift (App Code) | ![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/scala.png)  Scala (Intellij) |
|![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/javascript.png)  Javascript (Intellij) | ![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/python.png)  Python (PyCharm / Intellij) |
|![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/go.png)  Go (GoLand / Intellij) | ![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/php.png)  PHP (PhpStorm/ WebStorm/ Intellij)) |
|![](https://cdn.rawgit.com/gaplo917/GapStyle/master/preview/android-logcat.png)  Android Logcat |  |
