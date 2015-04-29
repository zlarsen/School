//
//  PlusEqualNode.cpp
//  Compiler
//
//  Created by Zach Larsen on 4/27/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

PlusEqualNode::PlusEqualNode(IdentifierNode *in, ExpressionNode *en)
: AssignmentStatementNode(in, en) {
    MSG("PlusEqualNode init");
}

PlusEqualNode::~PlusEqualNode() {
    MSG("PlusEqualNode deconstructor");
    delete mIdentifierNode;
    delete mExpressionNode;
}

void PlusEqualNode::Interpret() {
    int exp_value = mExpressionNode->Evaluate();
    exp_value += mIdentifierNode->Evaluate();
    mIdentifierNode->SetValue(exp_value);
}

void PlusEqualNode::Code(InstructionsClass &machineCode)
{
    machineCode.PushVariable(mIdentifierNode->GetIndex());
    mExpressionNode->CodeEvaluate(machineCode);
    machineCode.PopPopAddPush();
    machineCode.PopAndStore(mIdentifierNode->GetIndex());
}
