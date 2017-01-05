---
layout: post
title: "Final Thoughts on Three Days of Ruby"
description: "Ruby Roundup: Seven Languages in Seven Weeks"
category: development
share: true
tags: [seven languages in seven weeks, ruby, languages]
---

*A summary of my last 3 days exploring Ruby through <a href="http://pragprog.com/book/btlang/seven-languages-in-seven-weeks" target="_blank">Seven Languages in Seven Weeks.</a>* 

I really enjoyed the Ruby section of the book. I had worked with it before but I hadn't really taken time to appreciate the beauty of it. I gained a much better understanding of ducktyping, modules  and open classes. The exercises were great for making sure you really understood concepts and making you explore APIs further. I think I need to work through days 3's metaprogramming in more depth before I'll feel like I've really gotten to grips with it.

For those of you interested in why you'd pick Ruby here is a roundup which summarises the strengths and weaknesses of the language and highlights where the compromises have been made based on the book. 

## Strengths

It is a pure OO language so is consistent in its approach. Duck Typing allows polymorphic design based on what an object supports not its inheritance hierarchy. Module and open classes give the developer the freedom to attach behaviour. These features aimed at programmer productivity come at cost. They are hard to compile thus affecting performance. Ruby is ideal for scripting and web development (scale dependent).

### Scripting 

Ruby has a wide variety of libraries included with base and lots of gems/plugins available to handle common tasks e.g. processing XML, CSV files etc. 

### Web Development 

Rails, web application framework for Ruby, is one of the most successful web development frameworks of all time and built on MVC. It uses convention over configuration to keep configuration code minimal and has plugins to handle difficult production issues such as authentication, logging, and asynchronous background processes etc. 

### Time to Market

A big positive for Ruby is how quickly you can bring something to market. The expressive syntax, strong community and range of gems available make for a high level of productivity. 

## Weaknesses 

### Performance 

This is improving but the focus remains on programmer experience and many of the language's best features like ducktyping and open classes make it difficult to compile. It is however reasonable for many purposes. 

### Concurrency and OOP 

The handling of concurrency is something which is only starting to be address and is therefore not as well developed as in some other languages. It is improving. 

### IDEs 

Building IDEs for a dynamically typed language like Ruby is more difficult than a statically typed language like Java. 



