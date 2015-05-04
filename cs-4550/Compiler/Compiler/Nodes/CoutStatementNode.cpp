//
//  CoutStatementNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

CoutStatementNode::CoutStatementNode() {
    MSG("CoutStatementNode init");
    mEndlNode = new EndlNode();
}

CoutStatementNode::~CoutStatementNode() {
    MSG("CoutStatementNode deconstructor");
    for (int i=0; i<mExpressionNodes.size(); i++) {
        delete mExpressionNodes.back();
        mExpressionNodes.pop_back();
    }
    delete mEndlNode;
}

void CoutStatementNode::Interpret() {
    for (int i=0; i<mExpressionNodes.size(); i++) {
        if (mExpressionNodes.at(i) == NULL) {
            mEndlNode->Evaluate();
        }
        else {
            cout << mExpressionNodes.at(i)->Evaluate();
        }
    }
}

void CoutStatementNode::Code(InstructionsClass &machineCode) {
    for (int i=0; i<mExpressionNodes.size(); i++) {
        if (mExpressionNodes.at(i) == NULL) {
            mEndlNode->CodeEvaluate(machineCode);
        }
        else {
            mExpressionNodes.at(i)->CodeEvaluate(machineCode);
            machineCode.PopAndWrite();
        }
    }
}

void CoutStatementNode::AddExpressionNode(ExpressionNode *en) {
    mExpressionNodes.push_back(en);
}

// EndlNode

EndlNode::EndlNode() {}

EndlNode::~EndlNode() {}

int EndlNode::Evaluate(){
    cout << endl;
    return 0;
}

void EndlNode::CodeEvaluate(InstructionsClass &machineCode) {
    MSG("Endl Statement CodeEvaluate");
    machineCode.WriteEndl();
}
