//
//  StatementNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

StatementNode::StatementNode() {
    MSG("StatementNode init");
}

StatementNode::~StatementNode() {
    MSG("StatementNode deconstructor");
}

void StatementNode::Code(InstructionsClass &machineCode) {
    MSG("StatementNode Code");
}