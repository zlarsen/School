//
//  StatementGroupNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

StatementGroupNode::StatementGroupNode() {
    MSG("StatementGroupNode init");
}

StatementGroupNode::~StatementGroupNode() {
    MSG("StatementGroupNode deconstructor");
    for (int i=0; i<mStatementNodes.size(); i++) {
        delete mStatementNodes[i];
    }
}

void StatementGroupNode::AddStatement(StatementNode *statementNode) {
    mStatementNodes.push_back(statementNode);
}

void StatementGroupNode::Interpret() {
    for (int i=0; i<mStatementNodes.size(); i++) {
        mStatementNodes[i]->Interpret();
    }
}

void StatementGroupNode::Code(InstructionsClass &machineCode) {
    int size = (int) mStatementNodes.size();
    for(int i=0; i<size; i++) {
        mStatementNodes[i]->Code(machineCode);
    }
}