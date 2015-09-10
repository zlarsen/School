//
//  StateMachine.cpp
//  Compiler
//
//  Created by Zach on 2/2/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include "StateMachine.h"

StateMachine::StateMachine() {
    mCurrentState = START_STATE;
    for (int i=0; i<LAST_STATE; i++) {
        for (int j=0; j<LAST_CHAR; j++) {
            mLegalMoves[i][j] = CANTMOVE_STATE;
        }
    }
    
    for (int c=0; c<LAST_CHAR; c++) {
        mLegalMoves[LINE_COMMENT_STATE][c] = LINE_COMMENT_STATE;
        mLegalMoves[BLOCK_COMMENT1_STATE][c] = BLOCK_COMMENT1_STATE;
        mLegalMoves[BLOCK_COMMENT2_STATE][c] = BLOCK_COMMENT1_STATE;
    }
    
    mLegalMoves[LINE_COMMENT_STATE][NEW_LINE_CHAR] = START_STATE;
    mLegalMoves[BLOCK_COMMENT1_STATE][TIMES_CHAR] = BLOCK_COMMENT2_STATE;
    mLegalMoves[BLOCK_COMMENT2_STATE][TIMES_CHAR] = BLOCK_COMMENT2_STATE;
    mLegalMoves[BLOCK_COMMENT2_STATE][DIVIDE_CHAR] = START_STATE;
    
    // eof
    mLegalMoves[LINE_COMMENT_STATE][EOF_CHAR] = EOF_STATE;
    mLegalMoves[START_STATE][EOF_CHAR] = EOF_STATE;
    
    // integer
    mLegalMoves[START_STATE][DIGIT_CHAR] = INTEGER_STATE;
    mLegalMoves[INTEGER_STATE][DIGIT_CHAR] = INTEGER_STATE;
    
    // identifier
    mLegalMoves[START_STATE][LETTER_CHAR] = IDENTIFIER_STATE;
    mLegalMoves[IDENTIFIER_STATE][LETTER_CHAR] = IDENTIFIER_STATE;
    mLegalMoves[IDENTIFIER_STATE][DIGIT_CHAR] = IDENTIFIER_STATE;
    
    // whitespace
    mLegalMoves[START_STATE][WHITESPACE_CHAR] = START_STATE;
    mLegalMoves[START_STATE][NEW_LINE_CHAR] = START_STATE;
    
    // ; + - / *
    mLegalMoves[START_STATE][SEMICOLON_CHAR] = SEMICOLON_STATE;
    mLegalMoves[START_STATE][PLUS_CHAR] = PLUS_STATE;
    mLegalMoves[START_STATE][MINUS_CHAR] = MINUS_STATE;
    mLegalMoves[START_STATE][DIVIDE_CHAR] = DIVIDE_STATE;
    mLegalMoves[DIVIDE_STATE][DIVIDE_CHAR] = LINE_COMMENT_STATE;
    mLegalMoves[DIVIDE_STATE][TIMES_CHAR] = BLOCK_COMMENT1_STATE;
    mLegalMoves[START_STATE][TIMES_CHAR] = TIMES_STATE;
    
    // ()
    mLegalMoves[START_STATE][LPAREN_CHAR] = LPAREN_STATE;
    mLegalMoves[START_STATE][RPAREN_CHAR] = RPAREN_STATE;
    
    // {}
    mLegalMoves[START_STATE][LCURLY_CHAR] = LCURLY_STATE;
    mLegalMoves[START_STATE][RCURLY_CHAR] = RCURLY_STATE;
    
    // <>
    mLegalMoves[START_STATE][LESS_CHAR] = LESS_STATE;
    mLegalMoves[START_STATE][GREATER_CHAR] = GREATER_STATE;
    
    // =
    mLegalMoves[START_STATE][EQUAL_CHAR] = ASSIGNMENT_STATE;
    mLegalMoves[ASSIGNMENT_STATE][EQUAL_CHAR] = EQUAL_STATE;
    
    // <=
    mLegalMoves[LESS_STATE][EQUAL_CHAR] = LESS_EQUAL_STATE;
    
    // <<
    mLegalMoves[LESS_STATE][LESS_CHAR] = INSERTION_STATE;
    
    // >=
    mLegalMoves[GREATER_STATE][EQUAL_CHAR] = GREATER_EQUAL_STATE;
    
    // ||
    mLegalMoves[START_STATE][PIPE_CHAR] = PIPE1_STATE;
    mLegalMoves[PIPE1_STATE][PIPE_CHAR] = OR_STATE;
    
    // &&
    mLegalMoves[START_STATE][AMPERSAND_CHAR] = AMPERSAND1_STATE;
    mLegalMoves[AMPERSAND1_STATE][AMPERSAND_CHAR] = AND_STATE;
    
    // += -=
    mLegalMoves[PLUS_STATE][EQUAL_CHAR] = PLUS_EQUAL_STATE;
    mLegalMoves[MINUS_STATE][EQUAL_CHAR] = MINUS_EQUAL_STATE;
    
    // ^
    mLegalMoves[START_STATE][EXPONENT_CHAR] = EXPONENT_STATE;
    
    for (int i=0; i<LAST_STATE; i++) {
        mCorrespondingTokenTypes[i] = BAD_TOKEN;
    }
    mCorrespondingTokenTypes[IDENTIFIER_STATE] = IDENTIFIER_TOKEN;
    mCorrespondingTokenTypes[ASSIGNMENT_STATE] = ASSIGNMENT_TOKEN;
    mCorrespondingTokenTypes[INTEGER_STATE] = INTEGER_TOKEN;
    mCorrespondingTokenTypes[LPAREN_STATE] = LPAREN_TOKEN;
    mCorrespondingTokenTypes[RPAREN_STATE] = RPAREN_TOKEN;
    mCorrespondingTokenTypes[LCURLY_STATE] = LCURLY_TOKEN;
    mCorrespondingTokenTypes[RCURLY_STATE] = RCURLY_TOKEN;
    mCorrespondingTokenTypes[SEMICOLON_STATE] = SEMICOLON_TOKEN;
    mCorrespondingTokenTypes[LESS_STATE] = LESS_TOKEN;
    mCorrespondingTokenTypes[GREATER_STATE] = GREATER_TOKEN;
    mCorrespondingTokenTypes[LESS_EQUAL_STATE] = LESS_EQUAL_TOKEN;
    mCorrespondingTokenTypes[GREATER_EQUAL_STATE] = GREATER_EQUAL_TOKEN;
    mCorrespondingTokenTypes[OR_STATE] = OR_TOKEN;
    mCorrespondingTokenTypes[AND_STATE] = AND_TOKEN;
    mCorrespondingTokenTypes[PLUS_STATE] = PLUS_TOKEN;
    mCorrespondingTokenTypes[MINUS_STATE] = MINUS_TOKEN;
    mCorrespondingTokenTypes[TIMES_STATE] = TIMES_TOKEN;
    mCorrespondingTokenTypes[DIVIDE_STATE] = DIVIDE_TOKEN;
    mCorrespondingTokenTypes[EXPONENT_STATE] = EXPONENT_TOKEN;
    mCorrespondingTokenTypes[PLUS_EQUAL_STATE] = PLUS_EQUAL_TOKEN;
    mCorrespondingTokenTypes[MINUS_EQUAL_STATE] = MINUS_EQUAL_TOKEN;
    mCorrespondingTokenTypes[EQUAL_STATE] = EQUAL_TOKEN;
    mCorrespondingTokenTypes[INSERTION_STATE] = INSERTION_TOKEN;
    mCorrespondingTokenTypes[EOF_STATE] = EOF_TOKEN;
}

MachineState StateMachine::UpdateState(char currentCharacter,
                                       TokenType & correspondingTokenType) {
    CharacterType charType = BAD_CHAR;
    
    if (isdigit(currentCharacter)) {
        charType = DIGIT_CHAR;
    }
    else if (isalpha(currentCharacter)) {
        charType = LETTER_CHAR;
    }
    else if (currentCharacter == EOF) {
        charType = EOF_CHAR;
    }
    else if (currentCharacter == '\n') {
        charType = NEW_LINE_CHAR;
    }
    else if (isspace(currentCharacter)) {
        charType = WHITESPACE_CHAR;
    }
    else if (currentCharacter == '(') {
        charType = LPAREN_CHAR;
    }
    else if (currentCharacter == ')') {
        charType = RPAREN_CHAR;
    }
    else if (currentCharacter ==  '{') {
        charType = LCURLY_CHAR;
    }
    else if (currentCharacter == '}') {
        charType = RCURLY_CHAR;
    }
    else if (currentCharacter == ';') {
        charType = SEMICOLON_CHAR;
    }
    else if (currentCharacter == '<') {
        charType = LESS_CHAR;
    }
    else if (currentCharacter == '>') {
        charType = GREATER_CHAR;
    }
    else if (currentCharacter == '=') {
        charType = EQUAL_CHAR;
    }
    else if (currentCharacter == '+') {
        charType = PLUS_CHAR;
    }
    else if (currentCharacter == '-') {
        charType = MINUS_CHAR;
    }
    else if (currentCharacter == '/') {
        charType = DIVIDE_CHAR;
    }
    else if (currentCharacter == '*') {
        charType = TIMES_CHAR;
    }
    else if (currentCharacter == '|') {
        charType = PIPE_CHAR;
    }
    else if (currentCharacter == '&') {
        charType = AMPERSAND_CHAR;
    }
    else if (currentCharacter == '^') {
        charType = EXPONENT_CHAR;
    }
    
    if (charType == BAD_CHAR) {
        cerr << "Unknown character '" << currentCharacter << "'";
        exit(1);
    }
    
    correspondingTokenType = mCorrespondingTokenTypes[mCurrentState];
    mCurrentState = mLegalMoves[mCurrentState][charType];
    return mCurrentState;
}

MachineState StateMachine::GetCurrentState() {
    return mCurrentState;
}
