//
//  PlusNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

PlusNode::PlusNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("PlusNode init");
}

int PlusNode::Evaluate() {
    return mLeft->Evaluate() + mRight->Evaluate();
}

void PlusNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopAddPush();
}