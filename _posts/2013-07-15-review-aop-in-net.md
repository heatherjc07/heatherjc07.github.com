---
layout: post
title: "Review: AOP in .NET."
description: "Review of Manning Publication's AOP in .NET by Matthew Groves"
category: books
share: true
tags: [AOP, C#, review]
---

A few months ago I got the chance to get involved as a Manning Reviewer for [AOP in .NET](http://www.manning.com/groves/) by Matthew Groves. It was a great chance to see the effort and evolution that goes into a book before it comes out in print. Plus I got a chance to learn AOP, Aspect Orientated Programming, in .NET, having previously only used it in Java.

For those of you unfamiliar with Aspect Orientated Programming it is a means of modularising your cross cutting concerns, i.e. things like logging, auditing which are used throughout your application, and applying them to specific points in your code. It helps avoid repetition and tangling of code, where you end up mixing code for things like logging in with your business logic. It makes your code cleaner and easier to maintain.

[AOP in .NET](http://www.manning.com/groves/) is a great introduction to AOP. Assuming no prior knowledge it provides clear explanations of concepts and terms. 

Throughout the book new concepts are demonstrated using example code. One of the early code examples, which I found particularly powerful, takes the user via a series of refactoring exercises from code without AOP through to code using it. You couldn't get a clearer explanation of the benefits of AOP. I found all the code examples in the book well thought out and relevant, covering the kind of features you'd be using AOP to implement in real life projects. I also like the fact the book covers how to unit test aspects.

The code examples are in C# and Groves demonstrates two AOP tools [PostSharp](http://www.postsharp.net/) and [Castle DynamicProxy](http://www.castleproject.org/projects/dynamicproxy/). PostSharp uses annotations and compile time weaving while Castle DynamicProxy generates proxies on the fly at runtime. Groves outlines the benefits and limitations of both tools, leaving it up to the reader to make an informed choice as to which is the right tool for their project.

I think [AOP in .NET](http://www.manning.com/groves/) is a good introduction to AOP which moves at a pace which is easy for a beginner to follow and allows them to gain a clear understanding as to why an example is being coded in a particular way. This may feel slow to those with previous AOP knowledge or experienced coders.

Manning have kindly provided a discount code **msrev071513** which will save you 43% off [AOP in .NET](http://www.manning.com/groves/). It can also be redeemed against 4 other titles:

- [50 Android Hacks](http://www.manning.com/sessa/)
- [Windows Store App Development](http://www.manning.com/pbrown3/)
- [Arduino in Action](http://www.manning.com/mevans/)
- [Redis in Action](http://www.manning.com/carlson/)
