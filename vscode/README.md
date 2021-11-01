# GapStyle VS - Being Productive Beyond Your Status Quo.

The world-first\* productivity-oriented color scheme for intelliJ, VSCode to fill the gap between programming languages
and human.

![screenshots](https://raw.githubusercontent.com/gaplo917/GapStyle/master/vscode/screenshots/sample.ts.png)

GapStyle is a **_world-first_\*** **_productivity-oriented_** and **_semantic-highlighting-driven_** designed color
scheme that **_[each supported language](#actively-maintain-language)_** is tailored with
**_[rich colors while maintaining a comfortable contrast](#gapstyle-specification)_** to help developers boost reading
and writing speed in different programming languages.

\* world-first color scheme uses [https://github.com/gaplo917/GapStyle/tree/master/spec#color-palette](color affinity
design to boost developers' productivity by representing semantically similar syntax), i.e. class, abstract class, and
interface in Kotlin, Java, Scala, etc. See
[GapStyle Specification](https://github.com/gaplo917/GapStyle/tree/master/spec#color-palette)

## Objectives

- Optimize languages' color schemes to boost reading and writing speed on different languages. (Especially the language
  you are not familiar)
- Quickly learn similar syntax with a universal designed color across different languages
- Spot errors before program execution

## Actively Maintain Language

| IDE                                | Supported Language                                                                                                                                                              |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| VSCode (Semantic Highlight)        | Javascript, Typescript, C/C++, Java, Python                                                                                                                                     |
| VSCode (Standard Syntax Highlight) | Rust, Ruby, Dart, Go, PHP, Kotlin, Swift, Scala, Erlang, Elixir,GraphQL, HTML, XML, JSX, CSS/SCSS/SASS, YAML, TOML, SQL, Protobuf, Properties, Shell, Angular, Vue.js           |
| IntelliJ                           | Kotlin, Java, Swift, Dart, Rust, Scala, Javascript, Typescript, Go, Python, R, Android Logcat, Android Native (C / C++), Objective-C, SQL, HTML, CSS, PHP, Ruby, Erlang, Elixir |

## Enable Semantic Highlighting

1. Command + Shift + P
2. Search `settings.json` & Open
3. Paste the follow config

```
{
    "workbench.colorTheme": "GapStyle VS",
    "editor.semanticTokenColorCustomizations.enabled": true,
}
```

### Recommended Font

| Font                                                             | Platform | Ligature | Description                                                                                        |                             Action                              |
| ---------------------------------------------------------------- | -------- | :------: | -------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------: |
| [Hack JBM Ligatured](https://github.com/gaplo917/Ligatured-Hack) | VSCode   |    ✅    | Hack font with [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono) ligature, built by Gap | [Download](https://github.com/gaplo917/Ligatured-Hack/releases) |
| [Hack FC Ligatured](https://github.com/gaplo917/Ligatured-Hack)  | VSCode   |    ✅    | Hack font with [FIRA Code](https://github.com/tonsky/FiraCode) ligature, built by Gap              | [Download](https://github.com/gaplo917/Ligatured-Hack/releases) |
| [Hack](https://github.com/source-foundry/Hack)                   | VSCode   |    ❌    | Standard Hack font                                                                                 |   [Download](https://github.com/source-foundry/Hack/releases)   |

1. Install the recommended font into your system (i.e. Hack JBM Ligatured CCG)
2. Command + Shift + P
3. Search `settings.json` & Open
4. Paste the follow config

VSCode Editor Config (Full config)

```
{
    "workbench.colorTheme": "GapStyle VS",
    "editor.semanticTokenColorCustomizations.enabled": true,
    "editor.fontFamily": "'Hack JBM Ligatured CCG', 'Hack', Menlo, Monaco, 'Courier New', monospace",
    "editor.fontLigatures": true,
}
```

## Explore GapStyle On IntelliJ IDE

[IntelliJ](https://github.com/gaplo917/GapStyle)
