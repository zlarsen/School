//
//  WhileStatementNode.cpp
//  Compiler
//
//  Created by Zach on 4/6/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

WhileStatementNode::WhileStatementNode(ExpressionNode *en, StatementNode *sn)
: mExpressionNode(en), mStatementNode(sn) {
    MSG("WhileStatementNode init");
}

WhileStatementNode::~WhileStatementNode() {
    delete mExpressionNode;
    delete mStatementNode;
}

void WhileStatementNode::Interpret() {
    if (mExpressionNode->Evaluate()) {
        mStatementNode->Interpret();
    }
}

void WhileStatementNode::Code(InstructionsClass &machineCode)
{
    mExpressionNode->CodeEvaluate(machineCode);
    unsigned char * address0 = machineCode.GetAddress();
    unsigned char * InsertAddress = machineCode.SkipIfZeroStack();
    unsigned char * address1 = machineCode.GetAddress();
    mStatementNode->Code(machineCode);
    unsigned char * address2 = machineCode.GetAddress();
    machineCode.SetOffset(InsertAddress, (int) (address2 - address1));
    machineCode.SetOffset(InsertAddress, (int) (address0 - address2)); //offSet
    
}