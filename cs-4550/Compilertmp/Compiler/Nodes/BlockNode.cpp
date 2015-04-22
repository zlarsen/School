//
//  BlockNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

BlockNode::BlockNode(StatementGroupNode *sgn)
: mStatementGroupNode(sgn) {
    MSG("BlockNode init");
}

BlockNode::~BlockNode() {
    MSG("BlockNode deconstructor");
    delete mStatementGroupNode;
}

void BlockNode::Interpret() {
    MSG("BlockNode interpret");
    mStatementGroupNode->Interpret();
}

void BlockNode::Code(InstructionsClass &machineCode) {
    mStatementGroupNode->Code(machineCode);
}