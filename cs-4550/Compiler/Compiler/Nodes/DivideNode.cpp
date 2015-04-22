//
//  DivideNode.cpp
//  Compiler
//
//  Created by Zach on 4/1/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

DivideNode::DivideNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("DivideNode init");
}

int DivideNode::Evaluate() {
    return mLeft->Evaluate() / mRight->Evaluate();
}

void DivideNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopDivPush();
}