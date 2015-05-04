//
//  BinaryOperatorNode.cpp
//  Compiler
//
//  Created by Zach on 3/14/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#include <stdio.h>
#include "Node.h"

BinaryOperatorNode::BinaryOperatorNode(ExpressionNode *l, ExpressionNode *r)
: mRight(r), mLeft(l) {
    MSG("BinaryOperatorNode init");
}

BinaryOperatorNode::~BinaryOperatorNode() {
    MSG("BinaryOperatorNode deconstructor");
    delete mRight;
    delete mLeft;
}

// LessNode

LessNode::LessNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("LessNode init");
}

int LessNode::Evaluate() {
    MSG("LessNode eval");
    return mLeft < mRight;
}

void LessNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopLessPush();
}
// LessEqualNode

LessEqualNode::LessEqualNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("LessEqualNode init");
}

int LessEqualNode::Evaluate() {
    MSG("LessEqualNode eval");
    return mLeft->Evaluate() <= mRight->Evaluate();
}

void LessEqualNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopLessEqualPush();
}
// GreaterNode

GreaterNode::GreaterNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("GreaterNode init");
}

int GreaterNode::Evaluate() {
    MSG("GreaterNode eval");
    return mLeft->Evaluate() > mRight->Evaluate();
}


void GreaterNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopGreaterPush();
}

// GreaterEqualNode

GreaterEqualNode::GreaterEqualNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("GreaterEqualNode init");
}

int GreaterEqualNode::Evaluate() {
    MSG("GreaterEqualNode eval");
    return mLeft->Evaluate() >= mRight->Evaluate();
}


void GreaterEqualNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopGreaterEqualPush();
}
// EqualNode

EqualNode::EqualNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("EqualNode init");
}

int EqualNode::Evaluate() {
    MSG("EqualNode eval");
    return mLeft->Evaluate() == mRight->Evaluate();
}

void EqualNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopEqualPush();
}

// NotEqualNode

NotEqualNode::NotEqualNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("NotEqualNode init");
}

int NotEqualNode::Evaluate() {
    MSG("NotEqualNode eval");
    return mLeft->Evaluate() != mRight->Evaluate();
}


void NotEqualNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopNotEqualPush();
}

// OrNode

OrNode::OrNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("OrNode init");
}

int OrNode::Evaluate() {
    MSG("OrNode eval");
    return mLeft->Evaluate() || mRight->Evaluate();
}


void OrNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopOrPush();
}

// AndNode

AndNode::AndNode(ExpressionNode *l, ExpressionNode *r)
: BinaryOperatorNode(l, r) {
    MSG("AndNode init");
}

int AndNode::Evaluate() {
    MSG("AndNode eval");
    return mLeft->Evaluate() && mRight->Evaluate();
}

void AndNode::CodeEvaluate(InstructionsClass &machineCode)
{
    mLeft->CodeEvaluate(machineCode);
    mRight->CodeEvaluate(machineCode);
    machineCode.PopPopAndPush();
}