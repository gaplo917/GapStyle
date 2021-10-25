import { something } from 'js-yaml'

var globalVar;
/**
 * Constructor for <code>AjaxRequest</code> class
 * @param url the url for the request<p/>
 */
function AjaxRequest(url) {
  function local() {}
  var urls = [ "www.cnn.com", 5, globalVar];
  this.request = new XMLHttpRequest();
  url = url.replace(/^\s*(.*)/, "$1"); // skip leading whitespace
  /* check the url to be in urls */
  var a = "\u1111\z\n\u11";
  this.foo = new function() {};
  foo();
  #
  var hello = () => console.log("hello")

  local()

  hello()

  something.abc

  const a = 0
  a++
  a--
  a += 1
  a -= 1
  a != 1

  const b = true

  throw new Error({ foo: 'bar', b })

}

function arrowFunctionTest() {
  const array = [{ aaa: 1, bbb: '2' }]
  return array.reduce((acc, { aaa, bbb }) => acc + aaa + Number(bbb), 0)
}

@decorator()
class NameClass {}

arrowFunctionTest()
console.log(await new Promise((resolve) => resolve(new NameClass())))

