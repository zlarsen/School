//
//  MinusNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

MinusNode::MinusNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("MinusNode init");
}

int MinusNode::Evaluate() {
    MSG("MinusNode evaluate");
    return mLeft->Evaluate() - mRight->Evaluate();
}

void MinusNode::CodeEvaluate(InstructionsClass &machineCode)
{
    MSG("MinusNode CodeEvaulate");
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopSubPush();
}