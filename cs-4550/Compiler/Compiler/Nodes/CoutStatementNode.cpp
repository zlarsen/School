//
//  CoutStatementNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

CoutStatementNode::CoutStatementNode(ExpressionNode *en)
: mExpressionNode(en) {
    MSG("CoutStatementNode init");
}

CoutStatementNode::~CoutStatementNode() {
    MSG("CoutStatementNode deconstructor");
    delete mExpressionNode;
}

void CoutStatementNode::Interpret() {
    MSG("CoutStatementNode interpret");
    cout << mExpressionNode->Evaluate() << endl;
}

void CoutStatementNode::Code(InstructionsClass &machineCode) {
    
}