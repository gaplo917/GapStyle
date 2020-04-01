import checkChars from 'somewhere'

function sealed(constructor: Function) {
    Object.seal(constructor);
    Object.seal(constructor.prototype);
}

module ModuleValidator {
    export interface HasValidator1<T> {
        validateValue():Boolean;
    }

    type FooBarAlias = string;

    @sealed
    class HasValidator2 implements HasValidator1<String> {
        /* Processed values */
        static validatedValue:Array<String> = ["", "aa"];
        private myValue:String;

        /**
         * Constructor for <code>HasValidator</code> class
         * @param value for <i>validation</i>
         */
        constructor(valueParameter:String) {
            this.myValue = valueParameter;
            HasValidator2.validatedValue.push(valueParameter);
        }

        public validateValue():Boolean {
            var resultValue:Boolean = checkChars(this.myValue);
            return resultValue;
        }

        static createInstance(valueParameter:string): HasValidator2 {
            return new HasValidator2(valueParameter);
        }
    }

    function globalFunction<TypeParameter>(value:TypeParameter) { //global function
        return 42;
    }
    declare var declareUrl;
    var varUrl = declareUrl.replace(/^\s*(.*)/, "$1").concat("\u1111\z\n foo");
    var hello = () => console.log("hello");
    HasValidator2.createInstance(varUrl).validateValue();
    function acceptsUnion(s: string | number) {
       if (typeof s === "string") {
         s
       }
    }
}