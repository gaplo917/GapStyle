const fs = require('fs').promises
const path = require('path')
const { Type, Schema, load } = require('js-yaml')
const tinycolor = require('tinycolor2')

/**
 * @typedef {Object} TokenColor - Textmate token color.
 * @prop {string} [name] - Optional name.
 * @prop {string[]} scope - Array of scopes.
 * @prop {Record<'foreground'|'background'|'fontStyle',string|undefined>} settings - Textmate token settings.
 *       Note: fontStyle is a space-separated list of any of `italic`, `bold`, `underline`.
 */

/**
 * @typedef {Object} Theme - Parsed theme object.
 * @prop {Record<string[]>} variables - Gapstyle color variables.
 * @prop {Record<string, string|null|undefined>} colors - VSCode color mapping.
 * @prop {TokenColor[]} tokenColors - Textmate token colors.
 */

/**
 * @typedef {(yamlContent: string, yamlObj: Theme) => Theme} ThemeTransform
 */

const withAlphaType = new Type('!alpha', {
  kind: 'sequence',
  construct: ([hexRGB, alpha]) => hexRGB + alpha,
  represent: ([hexRGB, alpha]) => hexRGB + alpha,
})

const schema = Schema.create([withAlphaType])

/**
 * Soft variant transform. i.e. transform rgb(0,255,0,0.5) to hex string
 * @type {ThemeTransform}
 */
const transformSoft = (yamlContent, yamlObj) => {
  const variables = [...yamlObj.variables]
  return load(
    yamlContent.replace(/#[0-9A-F]{6}/g, color => {
      if (variables.includes(color)) {
        return tinycolor(color).toHexString()
      }
      return color
    }),
    { schema }
  )
}

function deepMerge(obj1, obj2) {
  // Helper function to check if value is a plain object
  function isPlainObject(value) {
    return value && typeof value === 'object' && !Array.isArray(value);
  }

  // If obj2 is not an object or is null, return obj2 (override)
  if (!isPlainObject(obj2)) {
    return obj2;
  }

  // Start with a copy of obj1
  const result = { ...obj1 };

  // Iterate over keys in obj2
  Object.keys(obj2).forEach(key => {
    const value2 = obj2[key];
    const value1 = obj1[key];

    if (isPlainObject(value2) && isPlainObject(value1)) {
      // Recursively merge if both are plain objects
      result[key] = deepMerge(value1, value2);
    } else {
      // Otherwise, override with obj2's value (handles primitives, arrays, etc.)
      result[key] = value2;
    }
  });

  return result;
}

async function readVariantFolder(folderPath) {
  const fileContents = [];

  // Read the directory synchronously
  const files = await fs.readdir(folderPath);

  // Iterate through each item in the folder
  for(let filePath of files) {
    const fullPath = path.join(folderPath, filePath);
    const filename = filePath.replace('.yml', '')
    fileContents.push({ variant: filename, yamlFile: await fs.readFile(fullPath, 'utf8') });
  }

  return fileContents;
}

module.exports = async () => {
  const yamlFile = await fs.readFile(path.join(__dirname, '..', 'src', 'gapstyle.yml'), 'utf-8')

  /** @type {Theme} */
  const base = load(yamlFile, { schema })

  // Remove nulls and other falsey values from colors
  for (const key of Object.keys(base.colors)) {
    if (!base.colors[key]) {
      delete base.colors[key]
    }
  }

  const variants = (await readVariantFolder(path.join(__dirname, '..', 'src', 'variants'))).map(({variant, yamlFile}) => {
    const clone = JSON.parse(JSON.stringify(base))
    return { variant, base: deepMerge(clone, load(yamlFile, { schema })) }
  })

  return {
    base,
    variants,
    soft: transformSoft(yamlFile, base), // not yet used
  }
}
