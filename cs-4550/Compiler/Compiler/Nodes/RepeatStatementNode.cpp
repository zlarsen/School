//
//  RepeatStatementNode.cpp
//  Compiler
//
//  Created by Zach on 4/8/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

RepeatStatementNode::RepeatStatementNode(ExpressionNode *en, StatementNode *sn)
: mExpressionNode(en), mStatementNode(sn) {
    MSG("RepeatStatementNode init");
}

RepeatStatementNode::~RepeatStatementNode() {
    MSG("RepeatStatementNode deconstructor");
    delete mExpressionNode;
    delete mStatementNode;
}

void RepeatStatementNode::Interpret() {
    MSG("RepeatStatementNode interpret");
    int j = mExpressionNode->Evaluate();
    for(int i = 0;i < j; i++){
        mStatementNode->Interpret();
    }
}