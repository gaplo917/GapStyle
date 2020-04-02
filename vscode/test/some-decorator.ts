export default function classDecorator<T extends { new (...args: any[]): {} }>(constructor: T) {
  return class extends constructor {
    newProperty = 'new property'
    hello = 'override'
  }
}
