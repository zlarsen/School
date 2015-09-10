//: Playground - noun: a place where people can play

import UIKit

func prime(n: Int) -> [Bool]
{
    var sieve = Array(count: n, repeatedValue: true)
    sieve[0] = false
    sieve[1] = false
    for var i = 2; i < n; ++i
    {
        if sieve[i]
        {
            for var j = i*2; j < n; j+=i
            {
                sieve[j] = false;
            }
        }
    }
    return sieve;
}
prime(100);