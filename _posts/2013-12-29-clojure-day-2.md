---
layout: post
title: "Clojure Day 2"
description: "Clojure Day 2: Seven Languages in Seven Weeks"
category: tutorial
share: true
tags: [seven languages in seven weeks, clojure, languages]
---
*My experience with day two of exploring Clojure through <a href="http://pragprog.com/book/btlang/seven-languages-in-seven-weeks" target="_blank">Seven Languages in Seven Weeks</a>.*

Todays chapter covers some of key concepts in Clojure such as sequences and the abstractionlayer that unifies all Clojure collections and ties them to Java collections. It also covers lazy evaluation and macros.

## Recursion with loop and recur

In Scala, Prolog and Erlang I've seen how powerful recursion can be. Being another functional language Clojure also relies on recursion rather than iteration.The example below calculates the total of a vector. The total of an empty vector is zero; the total of a populated vector is the head plus the total of the rest of the vector.

{% gist 8174263 total.clj %}

Unlike the other functional languages we've look at Clojure does not support implicit tail recursion optimization because of limitations of the JVM. As discussed in previous blogs this is a strategy to counteract memory consumption in recursive functions. Instead you need to explicitly recur through the use of loop and recur. Loop binds the variable on the left to the value on the right, the body of the function is called and then the function recur invokes the loop again passing in the new values.

I'll now modify the total function to use recur and loop. I bind the l variable to the vector and a c variable to 0. c will act as my accumulator holding the running total.

{% gist 8174263 total2.clj %}

## Sequences

A sequence in Clojure provides a generic way to treat all collections (both Clojure and Java) by providing a layer of abstraction round them.

There will be times you will want to test if you sequence meets a certain condition. In this case you use a function called a predicate. A predicate takes a test function, the sequence and returns a boolean.

{% gist 8174263 seq1.clj %}

### Changing a Sequence

Lets take a look at the functions provided to transform sequences.

{% gist 8174263 seq2.clj %}

Like Scala and Erlang, Clojure supports list comprehensions which combine multiple lists and filters, taking the possible combinations of the lists and applying the filters.

{% gist 8174263 seq3.clj %}

The reduce function is Clojure's way of accumulating the result of a function on a list.

{% gist 8174263 reduce.clj %}

Here are some examples of sorting

{% gist 8174263 sort.clj %}

### Lazy Evaluation

Clojure calculates sequence values as they are needed. Lets look at some of the different ways we can create sequences.

The range function allows you to generate sequences which have an upper and lower bound (or the default lower bound of zero).

{% gist 8174263 range.clj %}

The repeat function generates an infinite sequence of one repeated element. The take function allows us to grab a number of these values.

{% gist 8174263 take.clj %}

You can repeat elements in a list with cycle.

{% gist 8174263 cycle.clj %}

In the example below we build the infinite sequence. Drop the first two values in it and take the next 5. In order to make it easier to read instead of working inside out we can use left-to-right operator (->>) to apply each function to a result.

{% gist 8174263 leftright.clj %}

Another approach to create sequences is using the iterate function. This accepts a function and a start value.

{% gist 8174263 iterate.clj %}

In the example below we use the fib-pair function to generate a sequence of consecutive pairs in the Fibonacci sequence. We then use map to select the first element from the pair. Finally we take the first 5 values.

In the second example we select the 500th value using the nth function.

{% gist 8174263 fibpair.clj %}

## Macros

Being absolutely honest I read the macro section and felt a bit lost as to what it was about. It is in fact an easy enough concept to get your head around I just feel the book doesn't explain it in an easy to follow fashion. A macro allows the user to extend the compiler with their own code. A couple of examples of built in macros I've already used are a semicolon (;) which indicates a comment and a number sign (#) which indicates an anonymous function. We can use the macro defmacro to define our own macro.

Say we  wanted to have a way of saying unless a condition holds carry out an action. The code below shows why we can't use a function. The print will always occur as parameters are evaluated first.

{% gist 8174263 broken.clj %}

Instead we need to use a macro. test and body are substituted without being evaluated. We don't want if and not to execute right away so we quote them. Our not test and if are packaged as lists.

{% gist 8174263 unless.clj %}

Expanding it gives

{% gist 8174263 unless-expand.clj %}

Executing it gives the desired behaviour

{% gist 8174263 unless-execute.clj %}

## Homework
### Find:

**The implementation of some of the commonly used macros in the Clojure language**

{% gist 8174263 when.clj %}

**An example of defining your own lazy sequence**

{% gist 8174263 lazy-seq.clj %}

**The current status of the defrecord and protocol features (these features were still under development as this book was being developed)**

[defrecord](http://clojuredocs.org/clojure_core/1.3.0/clojure.core/defrecord)

[defprotocol](http://clojuredocs.org/clojure_core/1.3.0/clojure.core/defprotocol)

This article gives a nice explanation of protocols and defrecord and their use: [Solving the Expression Problem with Clojure 1.2](http://www.ibm.com/developerworks/java/library/j-clojure-protocols/index.html#datatypes). Protocols allow you to add functions to existing types without modifying or recompiling your existing code. defrecord creates a container for structured data that combines the features of maps and classes.

### Do:

**Implement an unless with an else condition using macros.**

{% gist 8174263 unless-else.clj %}

**Write a type using defrecord that implements a protocol.**

{% gist 8174263 protocol.clj %}

Check out my code at [github](https://github.com/heatherjc07/seven_languages_in_seven_days/tree/master/Clojure/Day2). 
