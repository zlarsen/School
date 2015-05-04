//
//  NotNode.cpp
//  Compiler
//
//  Created by Zach on 4/6/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

NotNode::NotNode(ExpressionNode *e)
: mExpressionNode(e) {
    MSG("NotNode init");
}

NotNode::~NotNode() {
    MSG("NotNode deconstructor");
}

int NotNode::Evaluate() {
    return !mExpressionNode->Evaluate();
}

void NotNode::CodeEvaluate(InstructionsClass &machineCode)
{
    MSG("NotNode CodeEvaluate");
    mExpressionNode->CodeEvaluate(machineCode);
}