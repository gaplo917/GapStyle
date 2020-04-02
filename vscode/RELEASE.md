# Update Color scheme

1. Build theme JSON from YAML: `npm run build`

# Update Version

1. Modify `package.json > version`

# Update description / changes notes

Update `README.md`

# Submit

1. Run `npm run build`
1. Run `npm run package`
1. Run `npm run vsce-publish`

(May need to `npx vsce login gaplo917`)
