//
//  Scanner.h
//  Compiler
//
//  Created by Zach on 2/9/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#ifndef __Compiler__Scanner__
#define __Compiler__Scanner__

#include <stdio.h>
#include <iostream>
#include <fstream>

#include "Token.h"

class Scanner {
public:
    Scanner(const char *filename);
    Token GetNextToken();
    Token PeekNextToken();
    int GetLineNumber();
private:
    ifstream mFin;
    int mLineNumber;
};

#endif /* defined(__Compiler__Scanner__) */
