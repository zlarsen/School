//
//  IfStatementNode.cpp
//  Compiler
//
//  Created by Zach on 4/6/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

IfStatementNode::IfStatementNode(ExpressionNode *en, StatementNode *sn, StatementNode *elseStatementNode)
: mExpressionNode(en), mStatementNode(sn), mElseStatementNode(elseStatementNode) {
    MSG("IfStatementNode init");
}

IfStatementNode::~IfStatementNode() {
    MSG("IfStatementNode deconstructor");
    delete mExpressionNode;
    delete mStatementNode;
    delete mElseStatementNode;
}

void IfStatementNode::Interpret() {
    if (mExpressionNode->Evaluate()) {
        MSG("IfStatementNode evaluated the if");
        mStatementNode->Interpret();
    }
    else {
        if (mElseStatementNode) {
            MSG("IfStatementNode evaluated the else");
            mElseStatementNode->Interpret();
        }
    }
}

void IfStatementNode::Code(InstructionsClass &machineCode)
{
    mExpressionNode->CodeEvaluate(machineCode);
    unsigned char * InsertAddress = machineCode.SkipIfZeroStack();
    unsigned char * address1 = machineCode.GetAddress();
    mStatementNode->Code(machineCode);
    unsigned char * address2 = machineCode.GetAddress();
    machineCode.SetOffset(InsertAddress, (int) (address2 - address1));
    
}