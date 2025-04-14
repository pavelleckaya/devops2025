#include <iostream>
#include <cstdlib>

int main() {
    const char* env = std::getenv("APP_ENV");
    for(int i = 0; i<=51; ++i){
        std::cout << i << " ";
    }
    std::cout << "Da zdravstvuet peterburg i eto gorod nash" << std::endl;
    std::cout << env << std::endl;

    return 0;
}