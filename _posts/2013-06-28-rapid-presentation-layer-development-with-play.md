---
layout: post
title: "Rapid Presentation Layer Development with Play"
description: "Using templates in Scala Play applications"
category: tutorial
tags: [scala, play, development]
share: true
---

One of the really nice features of Play is its [template engine](http://www.playframework.com/documentation/2.1.1/ScalaTemplates). It's something I made use of heavily in my latest piece of work developing a proof of concept for a customer. The template engine allows you to create reusable blocks of layout which you can use across multiple pages in your site. It's really easy to get started with templates as they don't require you to learn a new language. Mine consisted of Scala and HTML. 

Examples of things I ended up using templates for included:

+ The main page layout
+ Headers
+ Footers
+ Navigation menu
+ Form elements
+ Table 

Lets take a look at a couple of simple examples.

## The main page layout

Lets look at a very basic example of using a template for our common page structure. In the example below I've created a template to represent the basic structure of my site. In reality this would probably include more HTML. It accepts three parameters, a title, script (any additional JavaScript, CSS the  page requires) and content (content for the body of the page). 

{% gist 5887732 main.scala.html %}

I can then use the main template to create different views in my application. The first example is a common error page. The title is an input parameter, I'm not including any additional script and my contents are an html paragraph with the error message. 
 
{% gist 5887732 error.scala.html %}

When you create a template it is compiled as a Scala function with the following naming convention:

A template called views/error.scala.html would generate a function called views.html.error. I could call the error template from my controller using the following syntax

    views.html.error("My title","My error")

The second example is a message page with additional JavaScript include and html.

{% gist 5887732 message.scala.html %}

## A common page element

Templates can also be used for common page elements. For example in  each of my pages with a form I might want to display an error summary if the information entered was incorrect. I would probably want this to take a standard format so it would be a good candidate for creating a template. The template accepts a sequence of form errors and for each error creates a list item displaying the message and a link to the relevant form element.

{% gist 5887732 errorSummary.scala.html %}

## A common form element

Play provides [form template helpers](http://www.playframework.com/documentation/2.1.1/ScalaFormHelpers) to assist in the development of forms. Taking a look at the source for these can help you understand how to create your own like the inputDatePicker field template below. 

{% gist 5887732 inputDatePicker.scala.html %}

I would use this in a form within a template.

    @inputDatePicker(
       field = form("dateOfBirth"),
       args = '_label -> "Date", 
     '_mandatory -> true
       )

## Why do it?
 Taking the time at the start of development to identify the repeating elements in the presentation layer of your site and modelling them as templates can:

1. Improve your speed of development
2. Help create a consistent look and feel for your site
3. Reduce the overhead to modify the structure of the pages in your site
4.	 Reduce the overhead of adding to your site  

 I hope this post gave you a few ideas for how you can use them in your next application. 

