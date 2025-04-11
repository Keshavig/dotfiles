#include <iostream>

namespace global {
    void func(void) {
        std::cout << "Hello World\n" << std::endl;
    }
};

int main(void) {
    global::func();
    return 0;
}
