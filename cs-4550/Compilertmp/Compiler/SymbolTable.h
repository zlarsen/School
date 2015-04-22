//
//  SymbolTable.h
//  Compiler
//
//  Created by Zach on 2/18/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#ifndef __Compiler__SymbolTable__
#define __Compiler__SymbolTable__

#include <stdio.h>
#include <iostream>
#include <vector>
#include "Debug.h"

using namespace std;

class SymbolTable {
    
    struct Symbol {
        string mLabel;
        int mValue;
    };
    
public:
    SymbolTable();
    bool Exists(string s); //, bool withinScope=false
    void AddEntry(string s);
    int GetValue(string s);
    void SetValue(string s, int v);
    int GetIndex(string s); //, bool withinScope=false
    int GetCount();
private:
    vector<Symbol> mSymbols;
};

#endif /* defined(__Compiler__SymbolTable__) */
