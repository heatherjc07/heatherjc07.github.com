---
layout: post
title: "Global Settings in Scala"
description: "Defining behaviour at a global level in Play"
category: tutorial
share: true
tags: [scala, play, development]
---

In a recent Scala Play! project I wanted to carry out certain things on starting up and shutting down my application. Typical things like starting up and cleaning up resources. This is how I came across the Global Object. This gives you a hook into certain events like starting and stopping, when the user requests an action which doesn't exist and allows you to define code which is run when they occur.

You create the Global object in the default (empty) package.

    import play.api._
    
    object Global extends GlobalSettings {
     //override methods and provide your logic
    }

In this example I'm starting and stopping a test email service on starting and stopping my application and I'm defining pages to be displayed when an error or missing handler exception occurs.

{% gist 5853431 Global.scala %}

For more info see [Play!'s page on it](http://www.playframework.com/documentation/2.0/ScalaGlobal)