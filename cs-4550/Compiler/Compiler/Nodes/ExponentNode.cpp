//
//  ExponentNode.cpp
//  Compiler
//
//  Created by Zach Larsen on 5/4/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"
#include <math.h>

ExponentNode::ExponentNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("ExponentNode init");
}

int ExponentNode::Evaluate() {
    return pow(mLeft->Evaluate(),mRight->Evaluate());
}

void ExponentNode::CodeEvaluate(InstructionsClass &machineCode)
{
        //empty
}