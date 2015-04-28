//
//  Node.h
//  Compiler
//
//  Created by Zach on 3/2/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#ifndef __Compiler__Node__
#define __Compiler__Node__

#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>

#include "SymbolTable.h"
#include "Instructions.h"
#include "Debug.h"

using namespace std;

class Node;
class StartNode;
class ProgramNode;
class BlockNode;
class StatementGroupNode;
class StatementNode;
class DeclarationStatementNode;
class AssignmentStatementNode;
class CoutStatementNode;
class IfStatementNode;
class WhileStatementNode;
class RepeatStatementNode;
class IdentifierNode;
class ExpressionNode;
class IntegerNode;
class BinaryOperatorNode;
class PlusNode;
class MinusNode;
class TimesNode;
class DivideNode;
class LessNode;
class LessEqualNode;
class GreaterNode;
class GreaterEqualNode;
class EqualNode;
class NodeEqualNode;
class OrNode;
class AndNode;

class Node {
public:
    virtual ~Node();
    virtual void Interpret() = 0;
};

class StartNode: public Node {
public:
    StartNode(ProgramNode *programNode);
    ~StartNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    ProgramNode *mProgramNode;
};

class ProgramNode: public Node {
public:
    ProgramNode(BlockNode *blockNode);
    ~ProgramNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    BlockNode *mBlockNode;
};

class StatementGroupNode: public Node {
public:
    StatementGroupNode();
    ~StatementGroupNode();
    void AddStatement(StatementNode *statementNode);
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    vector<StatementNode*> mStatementNodes;
};

class StatementNode: public Node {
public:
    StatementNode();
    ~StatementNode();
    void Code(InstructionsClass &machineCode);
private:
};

class BlockNode: public StatementNode {
public:
    BlockNode(StatementGroupNode *statementGroupNode);
    ~BlockNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    StatementGroupNode *mStatementGroupNode;
};

class DeclarationStatementNode: public StatementNode {
public:
    DeclarationStatementNode(IdentifierNode *identifierNode);
    ~DeclarationStatementNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    IdentifierNode *mIdentifierNode;
};

class AssignmentStatementNode: public StatementNode {
public:
    AssignmentStatementNode(IdentifierNode *identifierNode, ExpressionNode *expressionNode);
    ~AssignmentStatementNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    IdentifierNode *mIdentifierNode;
    ExpressionNode *mExpressionNode;
};

class CoutStatementNode: public StatementNode {
public:
    CoutStatementNode(ExpressionNode *expressionNode);
    ~CoutStatementNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    ExpressionNode *mExpressionNode;
};

class IfStatementNode: public StatementNode {
public:
    IfStatementNode(ExpressionNode *en, StatementNode *sn, StatementNode *elseStatement);
    ~IfStatementNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    ExpressionNode *mExpressionNode;
    StatementNode *mStatementNode;
    StatementNode *mElseStatementNode;
};

class WhileStatementNode: public StatementNode {
public:
    WhileStatementNode(ExpressionNode *en, StatementNode *sn);
    ~WhileStatementNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);

private:
    ExpressionNode *mExpressionNode;
    StatementNode *mStatementNode;
};

class RepeatStatementNode: public StatementNode {
public:
    RepeatStatementNode(ExpressionNode *en, StatementNode *sn);
    ~RepeatStatementNode();
    void Interpret();
private:
    ExpressionNode *mExpressionNode;
    StatementNode *mStatementNode;
};

class ExpressionNode {
public:
    virtual ~ExpressionNode();
    virtual int Evaluate() = 0;
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class IntegerNode: public ExpressionNode {
public:
    IntegerNode(int value);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
    int mValue;
};

class NotNode: public ExpressionNode {
public:
    NotNode(ExpressionNode *e);
    ~NotNode();
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
    ExpressionNode *mExpressionNode;
};

class IdentifierNode: public ExpressionNode {
public:
    IdentifierNode(string label, SymbolTable *symbolTable);
    ~IdentifierNode();
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
    void DeclareVariable();
    void SetValue(int value);
    int GetIndex();
private:
    string mLabel;
    SymbolTable *mSymbolTable;
};

class BinaryOperatorNode: public ExpressionNode {
public:
    BinaryOperatorNode(ExpressionNode *right, ExpressionNode *left);
    ~BinaryOperatorNode();
private:
protected:
    ExpressionNode *mRight;
    ExpressionNode *mLeft;
};

class PlusNode: public BinaryOperatorNode {
public:
    PlusNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class MinusNode: public BinaryOperatorNode {
public:
    MinusNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class TimesNode: public BinaryOperatorNode {
public:
    TimesNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class DivideNode: public BinaryOperatorNode {
public:
    DivideNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class LessNode: public BinaryOperatorNode {
public:
    LessNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class LessEqualNode: public BinaryOperatorNode {
public:
    LessEqualNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class GreaterNode: public BinaryOperatorNode {
public:
    GreaterNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class GreaterEqualNode: public BinaryOperatorNode {
public:
    GreaterEqualNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class EqualNode: public BinaryOperatorNode {
public:
    EqualNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class NotEqualNode: public BinaryOperatorNode {
public:
    NotEqualNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class OrNode: public BinaryOperatorNode {
public:
    OrNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class AndNode: public BinaryOperatorNode {
public:
    AndNode(ExpressionNode *left, ExpressionNode *right);
    int Evaluate();
    void CodeEvaluate(InstructionsClass &machineCode);
private:
};

class PlusEqualNode: public AssignmentStatementNode {
public:
    PlusEqualNode(IdentifierNode *identifierNode, ExpressionNode *expressionNode);
    ~PlusEqualNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    IdentifierNode *mIdentifierNode;
    ExpressionNode *mExpressionNode;
};

class MinusEqualNode: public AssignmentStatementNode {
public:
    MinusEqualNode(IdentifierNode *identifierNode, ExpressionNode *expressionNode);
    ~MinusEqualNode();
    void Interpret();
    void Code(InstructionsClass &machineCode);
private:
    IdentifierNode *mIdentifierNode;
    ExpressionNode *mExpressionNode;
};
#endif /* defined(__Compiler__Node__) */
