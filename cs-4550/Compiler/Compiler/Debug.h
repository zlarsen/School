//
//  Debug.h
//  Compiler
//
//  Created by Zach on 2/9/15.
//  Copyright (c) 2015 Homework. All rights reserved.
//

#ifndef __Compiler__Debug__h
#define __Compiler__Debug__h

#define ShowMessages 0 // 0 or 1

#include <iostream>

#if ShowMessages
#define MSG(X) cout << X << endl;
#else
#define MSG(X) ;
#endif

#endif