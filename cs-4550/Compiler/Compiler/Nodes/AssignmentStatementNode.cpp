//
//  AssignmentStatementNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

AssignmentStatementNode::AssignmentStatementNode(IdentifierNode *in,
                                                 ExpressionNode *en)
: mIdentifierNode(in), mExpressionNode(en) {
    MSG("AssignmentStatementNode init");
}

AssignmentStatementNode::~AssignmentStatementNode() {
    MSG("AssignmentStatementNode deconstructor");
    delete mIdentifierNode;
    delete mExpressionNode;
}

void AssignmentStatementNode::Interpret() {
    mIdentifierNode->SetValue(mExpressionNode->Evaluate());
}

void AssignmentStatementNode::Code(InstructionsClass &machineCode)
{
    MSG("AssignmentStatementNode Code");
    mExpressionNode->CodeEvaluate(machineCode);
    machineCode.PopAndStore(mIdentifierNode->GetIndex());
}