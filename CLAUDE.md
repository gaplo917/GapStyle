# GapStyle Development Guide

## Build Commands
- IntelliJ plugin: `./build.sh <version_number>` (creates JAR file)
- VSCode theme: `cd vscode && npm run build` (generates theme from YAML)
- VSCode dev mode: `cd vscode && npm run dev` (watches for changes)
- VSCode packaging: `cd vscode && npm run package` (creates .vsix file)
- VSCode publishing: `cd vscode && npm run publish` (publishes to marketplace)

## Linting
- VSCode: `cd vscode && npm run lint`

## Color Standards
Follow GapStyle specification for color palette consistency:
- Default text: #A9B7C6 (Darcula-based)
- Keywords: #F92672 (Monokai-based, Bold)
- Classes/Structs: #66D9EF (Monokai-based)
- Methods: #A6E22E (Monokai-based)
- Strings: #E6DB74 (Monokai-based)
- Numbers: #AE81FF (Monokai-based)

## Styling Guidelines
- Maintain semantic highlighting principles
- Keep color contrast comfortable
- Use bold for keywords and singletons
- Use italic+bold for global/static variables
- Affinitive colors for semantically related syntax
- See spec/README.md for complete specification