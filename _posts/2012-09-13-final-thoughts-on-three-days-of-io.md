---
layout: post
title: "Final Thoughts on Three Days of Io"
description: "Io Roundup: Seven Languages in Seven Weeks"
category: tutorial 
tags: [seven languages in seven weeks, io, languages]
---

My experience of  three days of exploring Io through <a href="http://pragprog.com/book/btlang/seven-languages-in-seven-weeks" target="_blank">Seven Languages in Seven Weeks</a>. 

I think looking at Io has been a useful experience for me as it has got me thinking a bit more about the prototype languages I've already used. I've never taken the time to properly understand Javascript which I've used on all of the eCommerce applications I've written so maybe its time to go and have a proper look at that. Any suggestions for good reads or sites? 

It came as a bit of a shock moving from the friendly syntax of Ruby to Io. Reading Io code is definitely not as intuitive but I can see how this simple syntax is quick to learn. 

In summary the strengths of Io are: 

+ It is very flexible, allowing you to create your own syntax by redefining symbols and operators. Being so dynamic affects its performance in a single thread.  
+ It has a small footprint so is perfect for embedded systems. 
+ It has a simple easy to learn syntax so you can start looking at more complex concepts like metaprogramming and concurrency quickly. 
+ Its strong concurrency libraries make it good for parallel processing. Its concurrency constructs are up to date making it easier to build multithreaded applications which are quicker and easier to test. 

In summary the weaknesses of Io are

+ A lack of syntactic sugar makes it harder to read and write things concisely and debug 
+ It has a small community making it hard to find people who programme in it and meaning there are fewer libraries available. 
+ Its dynamic nature impacts on Io's single threaded execution speed. 
