# GapStyle VS Theme

![screenshots](https://raw.githubusercontent.com/gaplo917/GapStyle/master/vscode/screenshots/sample.ts.png)

GapStyle is a **_productivity-oriented_** designed color scheme with a
[list of supported languages](#actively-maintain-language). Each supported language is
tailor made and carefully tuned with
[rationale](https://github.com/gaplo917/gapstyle#gapstyle-specification).

GapStyle VS is designed with `semanticHighlighting` from draft, please enable it for best
syntax highlighting experience.

## Objectives

- Optimize languages' color schemes to boost productivity on reading/writing code
  (Especially the language your are not familiar)
- Quickly learn similar syntax with a universal designed color across different languages
- Spot syntax error before IDE inspection

## Actively Maintain Language

| IDE      | Supported Language                                                                                                                                             |
| -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| VSCode   | Kotlin, Java, Swift, Scala, Javascript, Typescript, C++, Go, Python, PHP, HTML, XML, JSX, CSS/SCSS/SASS, GraphQL, YAML, TOML, SQL, Protobuf, Properties, Shell |
| IntelliJ | Kotlin, Java, Swift, Scala, Javascript, Typescript, C++, Go, Python, Android Logcat, Android, PHP, HTML, XML, JSX, CSS/SCSS/SASS                               |
| XCode    | Swift, Objective C                                                                                                                                             |

## Enable Semantic Highlighting

1. Command + Shift + P
2. Search `settings.json` & Open
3. Paste the follow config

```
{
    "workbench.colorTheme": "GapStyle VS",
    "editor.tokenColorCustomizations": {
        "semanticHighlighting": true
    }
}
```

### Recommended Font

| Font                                                             | Platform | Ligature | Description                                                                                        |                             Action                              |
| ---------------------------------------------------------------- | -------- | :------: | -------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------: |
| [Hack JBM Ligatured](https://github.com/gaplo917/Ligatured-Hack) | VSCode   |    ✅    | Hack font with [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono) ligature, built by Gap | [Download](https://github.com/gaplo917/Ligatured-Hack/releases) |
| [Hack FC Ligatured](https://github.com/gaplo917/Ligatured-Hack)  | VSCode   |    ✅    | Hack font with [FIRA Code](https://github.com/tonsky/FiraCode) ligature, built by Gap              | [Download](https://github.com/gaplo917/Ligatured-Hack/releases) |
| [Hack](https://github.com/source-foundry/Hack)                   | VSCode   |    ❌    | Standard Hack font                                                                                 |   [Download](https://github.com/source-foundry/Hack/releases)   |

1. Install the recommended font into your system (i.e. Hack JBM Ligatured CCG)
1. Command + Shift + P
1. Search `settings.json` & Open
1. Paste the follow config

VSCode Editor Config (Full config)

```
{
    "workbench.colorTheme": "GapStyle VS"
    "editor.fontFamily": "'Hack JBM Ligatured CCG', 'Hack', Menlo, Monaco, 'Courier New', monospace",
    "editor.fontLigatures": true,
    "editor.tokenColorCustomizations": {
        "semanticHighlighting": true
    }
}
```

## Explore GapStyle On IntelliJ IDE

[IntelliJ](https://github.com/gaplo917/GapStyle)
