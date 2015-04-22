//
//  main.cpp
//  Instructions
//
//  Created by Zach on 4/13/15.
//
//

#include <iostream>
#include <stdio.h>
#include "Instructions.h"
using namespace std;

int main(int argc, const char * argv[]) {
    InstructionsClass code;
    code.PushValue(10);
    code.PopAndWrite();
    code.Finish();
    code.Execute();
    return 0;
    }
