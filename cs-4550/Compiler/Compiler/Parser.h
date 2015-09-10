//
//  Parser.h
//  Compiler
//
//  Created by Zach on 3/24/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#ifndef __Compiler__Parser__
#define __Compiler__Parser__

#include <stdio.h>

#include "Token.h"

class Scanner;
class SymbolTable;
class StartNode;
class ProgramNode;
class Token;
class StatementGroupNode;
class StatementNode;
class DeclarationStatementNode;
class AssignmentStatementNode;
class CoutStatementNode;
class IfStatementNode;
class RepeatStatementNode;
class WhileStatementNode;
class DoWhileNode;
class IdentifierNode;
class ExpressionNode;
class BlockNode;
class NotNode;
class IntegerNode;
class ExponentNode;

class Parser {
public:
    Parser(Scanner *scanner, SymbolTable *st);
    StartNode * Start();
private:
    Scanner * mScanner;
    SymbolTable * mSymbolTable;
    ProgramNode * Program();
    Token Match(TokenType expectedType);
    BlockNode * Block();
    StatementGroupNode * StatementGroup();
    StatementNode * Statement();
    DeclarationStatementNode * DeclarationStatement();
    AssignmentStatementNode * AssignmentStatement();
    CoutStatementNode * CoutStatement();
    IfStatementNode * IfStatement();
    WhileStatementNode * WhileStatement();
    DoWhileNode * DoWhile();
//    RepeatStatementNode * RepeatStatement();
    IdentifierNode * Identifier();
    ExpressionNode * Expression();
    ExpressionNode * Relational();
    ExpressionNode * Side();
    ExpressionNode * Term();
    ExpressionNode * Exponent();
    ExpressionNode * Factor();
    ExpressionNode * Or();
    ExpressionNode * And();
    IntegerNode * Integer();
    NotNode * Not();
};


#endif /* defined(__Compiler__Parser__) */
