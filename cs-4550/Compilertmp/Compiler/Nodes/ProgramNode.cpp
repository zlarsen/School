//
//  ProgramNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

ProgramNode::ProgramNode(BlockNode *bn)
: mBlockNode(bn) {
    MSG("ProgramNode init");
}

ProgramNode::~ProgramNode() {
    MSG("ProgramNode deconstructor");
    delete mBlockNode;
}

void ProgramNode::Interpret() {
    mBlockNode->Interpret();
}

void ProgramNode::Code(InstructionsClass &machineCode) {
    mBlockNode->Code(machineCode);
}