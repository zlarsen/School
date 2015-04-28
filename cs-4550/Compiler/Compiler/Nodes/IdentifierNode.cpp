//
//  IdentifierNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

IdentifierNode::IdentifierNode(string l, SymbolTable *st)
: mLabel(l), mSymbolTable(st) {
    MSG("IdentifierNode init");
}

IdentifierNode::~IdentifierNode() {
    MSG("IdentifierNode deconstructor");
}

int IdentifierNode::Evaluate() {
    return mSymbolTable->GetValue(mLabel);
}

void IdentifierNode::CodeEvaluate(InstructionsClass &machineCode) {
    machineCode.PushVariable(GetIndex());
}

void IdentifierNode::DeclareVariable() {
    mSymbolTable->AddEntry(mLabel);
}

void IdentifierNode::SetValue(int value) {
    mSymbolTable->SetValue(mLabel, value);
}

int IdentifierNode::GetIndex() {
    return mSymbolTable->GetIndex(mLabel);
}

