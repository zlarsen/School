//
//  IntegerNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

IntegerNode::IntegerNode(int val)
: mValue(val) {
    MSG("IntegerNode init");
}

int IntegerNode::Evaluate() {
    MSG("IntegerNode evaluate");
    return mValue;
}

void IntegerNode::CodeEvaluate(InstructionsClass &machineCode) {
    MSG("IntegerNode CodeEvaluate");
    machineCode.PushValue(this->mValue);
}