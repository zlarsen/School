//
//  ExpressionNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

ExpressionNode::~ExpressionNode() {
    MSG("ExpressionNode destructor");
}

void ExpressionNode::CodeEvaluate(InstructionsClass &machineCode)
{
    MSG("ExpressionNode CodeEvaluate");
    //fill in
}