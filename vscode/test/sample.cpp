/*
 * Block comment 
 */
#include <iostream>
#include <vector>

using namespace std;  // line comment

int test;

namespace foo {

  typedef struct StructA {
    int field;
  } StructType;
  enum Enum {Foo = 1, Bar = 2};

  StructType *globalVar;
  extern StructType *externVar;

  template <typename T>
  concept Concept = requires (T t) {
    t.field;
  };

  template<typename T, int N>
  class Class {
    T n;
  public:
    /**
     * Semantic highlighting:
     * Generated spectrum to pick colors for local variables and parameters:
     *  Color#1 SC1.1 SC1.2 SC1.3 SC1.4 Color#2 SC2.1 SC2.2 SC2.3 SC2.4 Color#3
     *  Color#3 SC3.1 SC3.2 SC3.3 SC3.4 Color#4 SC4.1 SC4.2 SC4.3 SC4.4 Color#5
     */
    void function(int param1, int param2, int param3) {
      int localVar1, localVar2, localVar3;
      int *localVar = new int[1];
      this->n = N;
      localVar1 = param1 + param2 - localVar3 * 10 / 100;

    label:
      printf("Formatted string %d\n\g", localVar[0]);
      printf(R"**(Formatted raw-string %d\n)**", 1);
      std::cout << (1 << 2) << std::endl;  

    #define FOO(A) A
    #ifdef DEBUG
      printf("debug");
    #endif
    }
  };
}

struct box {
  int length;
  int width;
  int height;

  int volume() {
    return length * width * height;
  }
};

int main() {
  box package{ 10, 10, 10 };
  std::cout << "Package length:" << package.length << endl;

  // Do silly things, using some C++17 features to enforce C++17 builds only.
  constexpr int digits[2] = {0, 1};
  auto [zero, one] = digits;
  return zero + one;
}