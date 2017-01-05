---
layout: post
title: "Clojure Day 1"
description: "Clojure Day 1: Seven Languages in Seven Weeks"
category: tutorial
share: true
tags: [seven languages in seven weeks, clojure, languages]
---

*My experience with day one of exploring Clojure through <a href="http://pragprog.com/book/btlang/seven-languages-in-seven-weeks" target="_blank">Seven Languages in Seven Weeks</a>.*

Clojure is a language I've been meaning to get around to looking at for a while so I guess now's my chance. It is another language that runs on the JVM like Scala and is based on Lisp. Running on the JVM means it has access to all the Java libraries. This means you'll often find a library which does what you need instead of having to implement everything form scratch. It is another functional language and is dynamically typed. 

After Fortran, Lisp is the oldest commercially active language. The acronym stands for LISt Processing and it is a language of lists. A function call uses the first list element as the function and the rest as the arguments more on this later but it takes a while to get your head around the syntax after years of infix notation. It's a very flexible language ideal for metaprogramming.


Although Clojure is a relatively new language it has a strong community which is good news for me as it makes learning it a whole lot easier!


Full instructions on how to get set up are included on the [Clojure](http://dev.clojure.org/display/doc/Getting+Started) site. In the book Tate uses [Leiningen tool2](https://github.com/technomancy/leiningen), a Clojure build tool to simplify his builds. It is a popular tool and there are a range of [plugins](https://github.com/technomancy/leiningen/wiki/Plugins) for it which the community have created and are available via github. I see there is also a [Clojure Maven Plugin](https://github.com/talios/clojure-maven-plugin) which I'll have to take a look at sometime having used Maven for most of my recent Java projects. Simple code can be tested in Clojure’s console called REPL. For more complex tasks you’ll need an IDE with Clojure support. Netbeans, VIM, Eclipse and emacs all provide suitable IDEs.


Full instructions on how to get set up are included on the Clojure site. In the book Tate uses Leiningen tool2, a Clojure build tool to simplify his builds. It is a popular tool and there are a range of plugins for it which the community have created and are available via github. I see there is also a Clojure Maven Plugin which I’ll have to take a look at sometime having used Maven for most of my recent Java projects. Simple code can be tested in Clojure's console called REPL. For more complex tasks you’ll need an IDE with Clojure support. Netbeans, VIM, Eclipse and emacs all provide suitable IDEs.

## Calling Basic Functions

The first thing to get your head around in Clojure is the prefix notation. A function call is enclosed entirely in parenthesis, with the first element being the function name and the rest the arguments.

{% gist 8164020 basic1.clj %}

A nice addition for division is the ratio data type. This allows you to delay computation to avoid loss of precision

{% gist 8164020 basic2.clj %}
    
Surrounding each function call in parenthesis has the advantage of making it very clear what arguments belong to what call. Clojure evaluates the functions in parenthetical order.
    
{% gist 8164020 basic3.clj %}

You can achieve some neat things with minimal syntax. In the example below I'm checking if the list of arguments is in ascending order.

{% gist 8164020 basic4.clj %}

Here's a string example. The str function calls the underlying Java toString function to concantenate strings togethers.

{% gist 8164020 basic5.clj %}

Here's how you code an if else. The first parenthesis is the condition to test, the second the code to be carried out if it is true and the third the code to be carried out if it is false.

{% gist 8164020 basic6.clj %}

## Lists, Maps, Sets and Vectors

### Lists

As lists evaluate to functions you can't do (1 2 3) as this will generate an error instead you need to do one of the following.
    
{% gist 8164020 list1.clj %}

Clojure provides functions to allow you to manipulate the list. Here are some examples below.

{% gist 8164020 list2.clj %}

### Vector 

Here is how you define a vector.

{% gist 8164020 vector2.clj %}

Here are some examples of functions you can use to manipulate a list.

{% gist 8164020 vector.clj %}

Note in the last example Clojure is returning a sequence and rendering it as a list rather than a vector in the repl.

### Sets

You define a set using the #{} syntax.

{% gist 8164020 set1.clj %}

We can assign the set to a variable called animals and then manipulate them.

{% gist 8164020 set2.clj %}

Here are some examples of how we can manipulate a set using functions provided by Clojure.

{% gist 8164020 set3.clj %}

It is possible to create a sorted set that takes items in any order and returns them in sorted order.

{% gist 8164020 set4.clj %}

### Maps 

You represent a map with curly braces
    
 {% gist 8164020 map1.clj %}

In the example below we can see that maps and keywords are functions so :ireland as a function looks itself up in map.

 {% gist 8164020 map2.clj %}

You can create a sorted map that takes items in any order and returns them sorted.
    
 {% gist 8164020 map3.clj %}

### Functions

Here is an example of how to define a function. We use the keyword defn to define it. The first String describes the function. This can be displayed using (doc force-it). We then have a parameter list. In this case there is one parameter, jedi. Finally we have the function body which simply concantenates the parameter to a string.

 {% gist 8164020 force-it.clj %}

### Bindings

Binding is the process of assigning parameters based on inbound arguments. Clojure provides a concept called destructuring which allows you to access any part of a parameter as an argument. Destructuring is a form of pattern matching. In the example below, board represents a noughts and crosses board. If we want to select the second element of the second list i.e. the centre value we could use the following code. Really nice and powerful syntax.
    
 {% gist 8164020 binding1.clj %}

We're ignoring the first and third elements, which are the top and bottom rows in our board. We then select the second element of the middle row. This can be further simplified to the following as we don't care about what follows the value we're selecting.
    
{% gist 8164020 binding2.clj %}

You can use destructuring in a let statement as well as an argument list .let binds a variable to a value. We could use let to hide the destructuring from the clients of the center function. Both forms produce equivalent results. It all depends on where you want the destructuring to happen.

{% gist 8164020 binding3.clj %}

You can destructure a map.

{% gist 8164020 binding4.clj %}

### Anonymous Functions

Clojure allows the creation of anonymous functions using the fn function.

Map in the example below is a higher-order function as it takes a function count as input. It generates a list of the length of people's names.
    
{% gist 8164020 anon1.clj %}

The example below uses an anonymous function to build a list of double the length of people's names.

{% gist 8164020 anon2.clj %}

This can be shortened to the following where # defines an anonymous function, with % bound to each item of the sequence.

{% gist 8164020 anon3.clj %}

## Higher order functions

apply applies a function to an argument list.
    
{% gist 8164020 apply.clj %}

The filter function takes a function that is a test and returns the sequence of elements that pass the test.

{% gist 8164020 filter.clj %}

## Conclusion

At the end of the chapter is an interview with Rich Hickey, Creator of Clojure. What comes across is how he designed Clojure with a particular purpose in mind having identified a gap in the market for a predominantly functional,extensible, dynamic language, with solid concurrency features for the JVM and CLR. Unlike previous Lisp dialects Clojure is aimed  as a general purpose production programming and unlike previous dialects is written with an understanding that most development is done in teams.(Other dialects aim to enpower the individual but encourage code which doesn't work well in a team environment) 

### Find:

**Examples using Clojure sequences**

http://clojure.org/sequences

http://www.gettingclojure.com/cookbook:sequences

blip.tv/clojure/clojure-sequences-740581

**The formal definition of a Clojure function**

http://clojure.org/functional_programming

**A script for quickly invoking the repl (clojure console) in your environment**

http://en.wikibooks.org/wiki/Learning_Clojure/Installation#Windows_Configuration


### Do:

**Implement a function called (big st n) that returns true if a string st is longer than n characters.**
  
{% gist 8164020 bigstn.clj %}

**Write a function called (collection-type col)**  

{% gist 8164020 collection-type.clj %}

  