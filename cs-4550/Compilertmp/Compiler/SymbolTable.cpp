//
//  SymbolTable.cpp
//  Compiler
//
//  Created by Zach on 2/18/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include "SymbolTable.h"

SymbolTable::SymbolTable() {}

bool SymbolTable::Exists(string s) {
    for (int i=0; i<mSymbols.size(); i++) {
        if (mSymbols[i].mLabel == s) {
            return true;
        }
    }
    return false;
}

void SymbolTable::AddEntry(string s) {
    if (Exists(s)) {
        cout << "Variable " << s << " exists." << endl;
        exit(1);
    }
    Symbol newSymbol;
    newSymbol.mValue = 0;
    newSymbol.mLabel = s;
    mSymbols.push_back(newSymbol);
}

int SymbolTable::GetValue(string s) {
    if (!Exists(s)) {
        cout << "Variable " << s << " does not exist." << endl;
        exit(1);
    }
    return mSymbols[GetIndex(s)].mValue;
}

void SymbolTable::SetValue(string s, int v) {
    if (!Exists(s)) {
        cout << "Variable " << s << " does not exist." << endl;
        exit(1);
    }
    mSymbols[GetIndex(s)].mValue = v;
}

int SymbolTable::GetIndex(string s) {
    for (int i=0; i<mSymbols.size(); i++) {
        if (mSymbols[i].mLabel == s) {
            return i;
        }
    }
    return -1;
}

int SymbolTable::GetCount() {
    return (int)mSymbols.size();
}