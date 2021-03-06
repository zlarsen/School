//
//  MinusEqualNode.cpp
//  Compiler
//
//  Created by Zach Larsen on 4/27/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

MinusEqualNode::MinusEqualNode(IdentifierNode *in, ExpressionNode *en)
: AssignmentStatementNode(in, en) {
    MSG("MinusEqualNode init");
}

MinusEqualNode::~MinusEqualNode() {
    MSG("MinusEqualNode deconstructor");
    delete mIdentifierNode;
    delete mExpressionNode;
}

void MinusEqualNode::Interpret() {
    int exp_value = mExpressionNode->Evaluate();
    exp_value -= mIdentifierNode->Evaluate();
    mIdentifierNode->SetValue(exp_value);
}

void MinusEqualNode::Code(InstructionsClass &machineCode)
{
    machineCode.PushVariable(mIdentifierNode->GetIndex());
    mExpressionNode->CodeEvaluate(machineCode);
    machineCode.PopPopSubPush();
    machineCode.PopAndStore(mIdentifierNode->GetIndex());
}
