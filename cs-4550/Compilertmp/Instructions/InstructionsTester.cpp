//
//  InstructionsTester.cpp
//  Instructions
//
//  Created by Zach on 4/13/15.
//
//

#include <stdio.h>

#include <iostream>
using namespace std;
int main()
{
    unsigned char mCode[] = {0x55, 0x8B, 0xEC, 0X5d, 0XC3};
    cout << "About to Execute the machine code...\n";
    void * ptr = mCode;
    void (*f)(void);
    f = (void (*)(void)) ptr ;
    f(); // call the array as if it were a function
    cout << "There and back again!\n\n";
    return 0;
}
