//
//  Token.h
//  Compiler
//
//  Created by Zach on 1/28/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#ifndef __Compiler__Token__
#define __Compiler__Token__

#include <stdio.h>
#include <iostream>
using namespace std;

enum TokenType {
    // reserved words
    VOID_TOKEN, MAIN_TOKEN, INT_TOKEN, COUT_TOKEN, FOR_TOKEN, IF_TOKEN, ELSE_TOKEN,
    WHILE_TOKEN, DO_TOKEN, REPEAT_TOKEN,
    
    // relational operators
    ASSIGNMENT_TOKEN, PLUS_TOKEN, MINUS_TOKEN, TIMES_TOKEN, DIVIDE_TOKEN,
    INSERTION_TOKEN, LESS_TOKEN, LESS_EQUAL_TOKEN, GREATER_TOKEN, GREATER_EQUAL_TOKEN,
    EQUAL_TOKEN, NOT_EQUAL_TOKEN, OR_TOKEN, AND_TOKEN, NOT_TOKEN,
    
    // other characters
    LPAREN_TOKEN, RPAREN_TOKEN, LCURLY_TOKEN, RCURLY_TOKEN, SEMICOLON_TOKEN,
    
    // other token types
    IDENTIFIER_TOKEN, INTEGER_TOKEN, BAD_TOKEN, EOF_TOKEN
};

const string gTokenTypeNames[] = {
    // reserved words
    "VOID", "MAIN", "INT", "COUT", "FOR", "IF", "ELSE",
    "WHILE", "DO", "REPEAT",
    
    // relational operators
    "ASSIGNMENT", "PLUS", "MINUS", "TIMES", "DIVIDE",
    "INSERTION", "LESS", "LESS_EQUAL", "GREATER", "GREATER_EQUAL",
    "EQUAL", "NOT_EQUAL", "OR", "AND", "NOT",
    
    // other characters
    "LPAREN", "RPAREN", "LCURLY", "RCURLY", "SEMICOLON",
    
    // other token types
    "IDENTIFIER", "INTEGER", "BAD", "EOF"
};

class Token {
private:
    TokenType mType;
    string mLexeme;
public:
    Token();
    Token(TokenType type, const string &lexeme);
    TokenType GetTokenType() const { return mType; }
    const string & GetTokenTypeName() const { return gTokenTypeNames[mType]; }
    string GetLexeme() const { return mLexeme; }
    void CheckReserved();
};

ostream & operator<<(ostream & out, const Token &token);

#endif /* defined(__Compiler__Token__) */
