//
//  TimesNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

TimesNode::TimesNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("TimesNode init");
}

int TimesNode::Evaluate() {
    return mLeft->Evaluate() * mRight->Evaluate();
}

void TimesNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopMulPush();
}