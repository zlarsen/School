//
//  StartNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

StartNode::StartNode(ProgramNode *pn)
: mProgramNode(pn) {
    MSG("StartNode init");
}

StartNode::~StartNode() {
    MSG("StartNode deconstructor");
    delete mProgramNode;
}

void StartNode::Interpret() {
    mProgramNode->Interpret();
}

void StartNode::Code(InstructionsClass &machineCode) {
    mProgramNode->Code(machineCode);
}