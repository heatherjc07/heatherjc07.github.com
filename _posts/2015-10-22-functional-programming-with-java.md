---
layout: post
title: "Functional Programming with Java"
description: "Review of plural sight course Functional Programming with Java and some of my takeaways"
category: tutorials
tags: [java, online courses, functional programming]
share: true
---
I just completed [Jessica Kerr's](https://twitter.com/jessitron) Pluralsight course [Functional Programming with Java](http://www.pluralsight.com/courses/java-functional-programming). It's not the first time I've played about with Java 8 and its functional features or functional programming in general. I still found the course useful especially as I applied what it covered to a project I worked on several years ago which was purely Object Orientated. This gave me a chance to put it in to practice and get a feel of the benefits this additional functionality provided.

BTW if you haven't read/watched anything created by Jessica before I really recommend that you should check out her [blog](http://blog.jessitron.com) or [twitter feed](https://twitter.com/jessitron). The quality of what she produces was one of the things which attracted me to the course.

### Create easy to read code

If you've ever had to support or enhance someone elses code you'll appreciate the importance of creating code which is easy to follow. In an ideal world code should be [self-documenting](https://en.wikipedia.org/wiki/Self-documenting). Two of the big benefits I found when rewriting the project using functional programming was it really focuses you on breaking the code down into small reusable functions and, where appropriate, separating out the side effects from the core computation.

I think the ability to chain functions together allows you to create code that reads much more like the business requirements it is trying to satisfy. Functions can be passed as parameters and used as return values.

{% gist 5a0e4d916fcf5ccd44ce prescription.java %}

We can go one step further, a reasonable assumption is that we'll want to filter prescription items on more than one criteria so lets create a common filter function that accepts a predicate, a statement that returns true or false depending on the value passed in.

{% gist 5a0e4d916fcf5ccd44ce prescription2.java %}

In the example we're filtering, mapping and reducing each item. You might think to look at it we're iterating through and filtering each item, then iterating again and mapping and then iterating again and reducing. Infact it is much more efficient than that. There is only one iteration round the prescription items which the functions being called on each item in turn. I recommend checking out the 'One Trip Through' and 'Lazy Streams' sections of the [Course](http://www.pluralsight.com/courses/java-functional-programming)

Another bonus to the code above is we're being [declarative](https://en.wikipedia.org/wiki/Declarative_programming). We're writing code that represents the business logic rather than the control flow to carry it out.

### Avoid duplication and magic

I can't take credit for the following example as it is lifted from Jessica's course. The function can be used to time a piece of code. It wraps the code which is passed in using the Supplier. To avoid tying ourselves to a particular means of displaying the code we pass in the output method using Consumer. In the example below I'm using System.out but in real life it is more likely to be your logging framework.

{% gist 5a0e4d916fcf5ccd44ce timeOperation.java %}

This follows the [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns) design principle. We're not mixing our timing code with our calculation logic. It is reusable so we're keeping our code [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself). This can be achieved other ways currently e.g. via annotations but this is much more explicit with the implementation and the link less hidden.

### Simplication of making operations parallel

Suppose we're gathering stats on the treatment carried out by a particular contractor. This could be very CPU intensive and we might want to parallelize it. You can see in the example below it is as simple as adding parallel() after the stream, our business logic stays the same.

{% gist 5a0e4d916fcf5ccd44ce parallalContractorTreatmentStats.java %}

### The power of optional versus null

I hadn't thought fully about the power of optional versus null until listening to the course. Jessica includes an example of how, using optional, we can avoid doing null checks at various levels within our business logic and just handle the empty check at UI level.

In the example below there might be no instances of treatment which includes wisdom tooth extraction but we don't need to care about that when retrieving a contractor who has carried it out. If the treatment is empty the map doesn't get carried out. We only handle it in the UI when we're displaying our message using orElse to indicate if no matching contractor was found.

{% gist 5a0e4d916fcf5ccd44ce findExampleOfTreatment.java  %}





