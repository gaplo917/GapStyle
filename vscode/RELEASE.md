# Update Color scheme

1. Check [Quickstart guide](vsc-extension-quickstart.md)
2. Make changes to [src/gapstyle.yml](src/gapstyle.yml)
3. Build theme JSON from YAML: `npm run build`

# Update Version

1. Modify `package.json > version`

# Update description / changes notes

Update `README.md`

# Submit

1. Run `npm run build`
1. Run `npm run package`
1. Run `npm run publish`

(May need to `npx vsce login gaplo917`)

### Generate Personal Access Token

Read

- https://code.visualstudio.com/api/working-with-extensions/publishing-extension

- https://dev.azure.com/gaplotech/_usersSettings/tokens
