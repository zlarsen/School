//
//  Token.cpp
//  Compiler
//
//  Created by Zach on 1/28/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include "Token.h"

Token::Token() {}

Token::Token(TokenType type, const string &lexeme) {
    mType = type;
    mLexeme = lexeme;
    CheckReserved();
}

void Token::CheckReserved() {
    const char *lexeme = mLexeme.c_str();
    if (strcmp(lexeme, "void") == 0) {
        mType = VOID_TOKEN;
    }
    else if (strcmp(lexeme, "main") == 0) {
        mType = MAIN_TOKEN;
    }
    else if (strcmp(lexeme, "int") == 0) {
        mType = INT_TOKEN;
    }
    else if (strcmp(lexeme, "cout") == 0) {
        mType = COUT_TOKEN;
    }
    else if (strcmp(lexeme, "for") == 0) {
        mType = FOR_TOKEN;
    }
    else if (strcmp(lexeme, "if") == 0) {
        mType = IF_TOKEN;
    }
    else if (strcmp(lexeme, "else") == 0) {
        mType = ELSE_TOKEN;
    }
    else if (strcmp(lexeme, "while") == 0) {
        mType = WHILE_TOKEN;
    }
    else if (strcmp(lexeme, "do") == 0) {
        mType = DO_TOKEN;
    }
    else if (strcmp(lexeme, "repeat") == 0) {
        mType = REPEAT_TOKEN;
    }
}

ostream & operator<<(ostream &out, const Token &token) {
    cout << token.GetTokenTypeName() << " " << token.GetLexeme();
    return out;
}