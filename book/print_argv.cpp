#include <iostream>                                         // 1 
                                                            // 2 
using namespace std;                                        // 3 
                                                            // 4 
int main(int argc, char * argv[]) {                         // 5 
    while (*argv) {                                         // 6 
        cout << *(argv++) << endl;                          // 7 
    }                                                       // 8 
    return 0;                                               // 9 
}                                                           // 10
