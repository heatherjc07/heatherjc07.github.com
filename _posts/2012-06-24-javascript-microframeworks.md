---
layout: post
title: "JavaScript MicroFrameworks"
description: "Introduction to JavaScript MicroFrameworks"
category: trends
share: true
tags: [JavaScript, MicroFrameworks]
---

Micro-Frameworks are frameworks developed to provide a particular piece of functionality and do it really well. Thomas Fuchs has created a site, <a href="http://microjs.com/" target="_blank">microjs</a> ,to help make people aware of the best Micro-Frameworks and show how compact and powerful they can be. His aim is to encourage people to make an active choice about the right JavaScript Framework for their project and not just plump for the current defacto choice. I intend to take a look  through some of the frameworks and read the code behind a few of them with the aim to improving my knowledge and understanding of JavaScript . I'm hoping reading the code behind a well written Micro-Framework will be an education in how to write good JavaScript because of their size and the fact they focus on one problem
 
There are two main reasons why you would look at using Micro-Frameworks. The first is to give you functionality which your main framework does not provide. Here you would use it in addition to your main framework. The second is if you feel that the cost on performance of using a large library, which provides a range of functionality, is too high for the benefits it gives you. Perhaps you only require a small subset of the power it provides. With the performance of websites being an important factor in retaining customers it's natural that developers are looking for ways to reduce the amount of code loading to improve page load times. In this case a micro framework or combination of micro frameworks to create a custom framework might prove the best solution.
 
When selecting a Micro-Framework for either reason a developer must remember to consider all of the factors they would normally look at when selecting a framework. These include:

+ The number of people working on the framework. Typically you want a number of people to be developing it to increase the chance of the framework continuing to develop and mature.
+ The stability/level of testing. This is especially important in a corporate project. You need to have confidence that each release is well tested and won't introduce bugs into your application.
+ Cross Browser support. You need to have confidence your site will behave/appear correctly across browsers.
+ How active the community is behind it. This can impact on the longevity of a framework, the level of documentation and support. 

When aiming to save on file size by creating your own custom framework from multiple micro-frameworks developers need to consider how much of a saving they will actually make. Whether the saving is worth the effort required to combine multiple frameworks with their application. If there are other approaches to solving the performance issue. There are JavaScript frameworks which are modular and allow you to leave out the functionality which you don't require. For example MooTools provides a core builder which allows you to build a file of your chosen components. There are also ways you can improve how your page appears to respond for a user for example

+ Placing the references to your scripts at the bottom of the page.
+ Using script loaders that once loaded (as they are written in js too) allow your page to be displayed while loading the JavaScript files your page requires. (dynamically creating a element and assigning its src attribute leads to a download that doesn't block other downloads or page processes)
+ Using lazy loading of JavaScript as and when you require it
 
Starting to look at Micro-Frameworks has reminded me of the importance of being aware of the options available to me and the importance of paying due diligence to all of my choices. While reading about it I've become more aware of some of the different approaches that can be taken to improving the performance of pages containing JavaScript. It has also encouraged me to try to take a look at some of the underlying code behind Micro-Frameworks to help improve my JavaScript. Something I've badly neglected up until now.

