//
//  DeclarationStatementNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

DeclarationStatementNode::DeclarationStatementNode(IdentifierNode *in)
: mIdentifierNode(in) {
    MSG("DeclarationStatementNode init");
}

DeclarationStatementNode::~DeclarationStatementNode() {
    MSG("DeclarationStatementNode deconstructor");
    delete mIdentifierNode;
}

void DeclarationStatementNode::Interpret() {
    MSG("DeclarationStatementNode interpret");
    mIdentifierNode->DeclareVariable();
}

void DeclarationStatementNode::Code(InstructionsClass &machineCode)
{
    MSG("DeclarationStatementNode Code");
    mIdentifierNode->DeclareVariable();
}