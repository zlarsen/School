//
//  Scanner.cpp
//  Compiler
//
//  Created by Zach on 2/9/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//
// Check out Graphvis

#include "Scanner.h"
#include "StateMachine.h"

using namespace std;

Scanner::Scanner(const char *filename) {
    mFin.open(filename);
    mLineNumber = 1;
}

Token Scanner::GetNextToken() {
    StateMachine stateMachine;
    TokenType correspondingTokenType;
    MachineState currentState = stateMachine.GetCurrentState();
    string lexeme;
    
    do {
        char c = mFin.get();
        lexeme += c;
        if (c == '\n') {
            mLineNumber++;
        }
        currentState = stateMachine.UpdateState(c, correspondingTokenType);
        if (currentState == START_STATE || currentState == EOF_STATE) lexeme = "";
    } while (currentState != CANTMOVE_STATE);
    
    if (correspondingTokenType == BAD_TOKEN) {
        cerr << "Could not build token from lexeme: " << lexeme;
        exit(1);
    }
    
    if (lexeme.back() == '\n') {
        mLineNumber--;
    }
    
    mFin.unget();
    lexeme.pop_back();
    Token token(correspondingTokenType, lexeme);
    
    return token;
}

Token Scanner::PeekNextToken() {
    long pos = mFin.tellg();
    int lineNum = mLineNumber;
    Token tc = GetNextToken();
    if (!mFin) {
        mFin.clear();
    }
    mFin.seekg(pos);
    mLineNumber = lineNum;
    
    return tc;
}

int Scanner::GetLineNumber() {
    return mLineNumber;
}