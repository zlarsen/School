//
//  main.cpp
//  Compiler
//
//  Created by Zach on 1/28/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <iostream>
#include <assert.h>

#include "Token.h"
#include "Scanner.h"
#include "SymbolTable.h"
#include "Parser.h"
#include "Node.h"
bool interpret = true;
bool code = true;

void CodeAndExecute(){

    Scanner scanner("/Users/zach/Code/school/cs-4550/Compiler/Compiler/test.txt");
    SymbolTable symbolTable;
    Parser parser(&scanner, &symbolTable);
    StartNode *root = parser.Start();
    InstructionsClass machineCode;
    root->Code(machineCode);
    machineCode.Finish();
    machineCode.Execute();
    
}


void scan() {
    Scanner scanner("/Users/zach/Code/school/cs-4550/Compiler/Compiler/main.txt");
    Token token;
    do {
        token = scanner.GetNextToken();
        cout << token << " " << scanner.GetLineNumber() << endl;
    } while (token.GetTokenType() != EOF_TOKEN);
}

void testParser() {
    SymbolTable symbolTable;
    Scanner scanner("/Users/zach/Code/school/cs-4550/Compiler/Compiler/test.txt");
    Parser parser(&scanner, &symbolTable);
    StartNode *root = parser.Start();
    root->Interpret();
}

void testSymbolTable() {
    SymbolTable table;
    
    assert(table.GetCount() == 0);
    assert(!table.Exists("test"));
    table.AddEntry("test");
    assert(table.Exists("test"));
    assert(table.GetCount() == 1);
    
    assert(table.GetIndex("test") == 0);
    
    assert(table.GetValue("test") == 0);
    
    table.SetValue("test", 2);
    assert(table.GetValue("test") == 2);
    
    table.SetValue("ploopy", 2); // variable does not exist
    //  table.AddEntry("test"); // variable already exists
    // table.GetValue("ploopy"); // variable does not exist
}

int main(int argc, const char * argv[]) {
    if(code) {
        CodeAndExecute();
    }
    if(interpret) {
        testParser();
    }
    return 0;
}
