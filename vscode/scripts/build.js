const fs = require('fs')
const path = require('path')
const generate = require('./generate')

const THEME_DIR = path.join(__dirname, '..', 'themes')

if (!fs.existsSync(THEME_DIR)) {
  fs.mkdirSync(THEME_DIR)
}

module.exports = async () => {
  const { base, variants } = await generate()

  return Promise.all([
    fs.promises.writeFile(path.join(THEME_DIR, 'gapstyle.json'), JSON.stringify(base, null, 4)),
    ...variants.map(({variant, base}) => {
      return fs.promises.writeFile(path.join(THEME_DIR, `gapstyle-${variant}.json`), JSON.stringify(base, null, 4))
    }),
    fs.promises.writeFile(
      path.join(THEME_DIR, 'gapstyle.shiki.json'),
      JSON.stringify(
        {
          name: 'GapStyle',
          settings: base.tokenColors,
        },
        null,
        4
      )
    ),
  ])
}

if (require.main === module) {
  module.exports()
}
