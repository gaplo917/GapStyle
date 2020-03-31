# Update Color scheme

1. Modify GapStyle in intellij
2. Export GapStyle in .icls format in build/ folder
3. `diff` the newly exported .icls with
   `intellij_androidstudio/GapStyle/colors/GapStyle.xml`
4. Add necessary changes on the source

# Update Version

1. Modify `intellij/GapStyle/colors/GapStyle.xml` `<scheme name="GapStyle 2.3" ... />`
2. Modify `intellij/GapStyle/META-INF/plugin.xml` `<version>2.3</version>`

# Update description / changes notes

Update `intellij/GapStyle/META-INF/plugin.xml`

# Submit

1. Run `sh build.sh 2.3`
2. Submit `intellij/GapStyle2.3.jar` to
   https://plugins.jetbrains.com/plugin/10559-gapstyle-color-scheme
