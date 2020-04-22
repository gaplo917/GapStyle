import classDecorator from './some-decorator'
import * as Components from './SomeComponent'
import { SomeComponent } from './SomeComponent'

module ModuleValidator {
  export interface HasValidator1<T> {
    validateValue(): Boolean
  }

  type FooBarAlias = string

  class HasValidator2 implements HasValidator1<String> {
    /* Processed values */
    static validatedValue: Array<String> = ['', 'aa']
    private myValue: String

    /**
     * Constructor for <code>HasValidator</code> class
     * @param value for <i>validation</i>
     */
    constructor(valueParameter: String) {
      this.myValue = valueParameter
      HasValidator2.validatedValue.push(valueParameter)
    }

    public validateValue(): Boolean {
      var resultValue: Boolean = checkChars(this.myValue)
      return resultValue
    }

    static createInstance(valueParameter: string): HasValidator2 {
      return new HasValidator2(valueParameter)
    }
  }

  function globalFunction<TypeParameter extends number>(value: TypeParameter) {
    // destructure
    const { a, b, c } = { a: 1, b: 2, c: 3 }
    return a + b + c + value
  }

  function arrowFunctionTest() {
    const array = [{ aaa: 1, bbb: '2' }]
    return array.reduce((acc, { aaa, bbb }) => acc + aaa + Number(bbb), 0)
  }

  declare var declareUrl
  var varUrl = declareUrl.replace(/^\s*(.*)/, '$1').concat('\u1111z\n foo')
  var hello = () => console.log('hello')
  HasValidator2.createInstance(varUrl).validateValue()
  function acceptsUnion(s: string | number) {
    if (typeof s === 'string') {
      s
    }
    throw new Error('testing')
  }
  new RegExp(/^[\w\.-]+@([\w\-]+|\.)+[A-Z0-9]{2,4}(?x)/)
  new RegExp(/\x0g\#\p{Alpha}\1/)
  new RegExp(/.*\Q...\E$/)

  new SomeComponent()

  globalFunction<SomeComponent>('123')
  globalFunction<FooBarAlias>('123')
  hello()
  acceptsUnion('123')
  arrowFunctionTest()
  new Components.SomeComponent()
}

@classDecorator
class ABC {}

new ABC()

enum EnumTest {
  ENUM_1,
  ENUM_2,
}

ModuleValidator

const p = new Promise(resolve => {
  resolve(EnumTest.ENUM_1)
})
