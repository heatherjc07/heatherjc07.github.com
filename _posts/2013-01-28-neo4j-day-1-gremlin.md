---
layout: post
title: "Neo4j Day 1 (Gremlin)"
description: "Using Gremlin with Neo4J"
category: tutorial
share: true
tags: [seven databases in seven weeks, nosql, data, neo4j, gremlin]
---

*My experience with Day 1 of [Neo4j](http://www.neo4j.org/) in [Seven Databases in Seven Days](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).*

## What is Gremlin?

There are lots of different ways to interact with Neo4j but my first experience was with [Gremlin](https://github.com/tinkerpop/gremlin/wiki). Gremlin is a graph traversal language written in Groovy. Don't worry if you haven't any previous Groovy experience because I didn't either. We'll look at writing some Groovy during this blog when I cover creating Domain Specific steps. Coming from a predominantly Java background I found Groovy easy to pick up as it runs on the JVM and has quite a Java like syntax.

The really handy thing about Gremlin is that the Neo4j web GUI includes a console which you can type your Gremlin commands into and see the results they pull back, no additional set up required. Simply click on the console tab and select Gremlin.

## Terminology

In my previous Neo4j post I talked about nodes and the relationships between them. Gremlin uses a slightly different syntax. Instead it talks about vertexes and edges. Different names same concepts.

I'm going to use the relationships in my immediate family as the data for my Neo4j graph. Below is a basic family tree.

![family tree]({{ site.url}}/images/neo4j-gremlin/family_tree.JPG)


The family tree just shows marriages and parent-child relationships but the people in it are related in lots of other ways, aunt, uncles, cousin, grandparents etc. Neo4j is perfect for representing this information as it is highly interconnected information which lots of relationships. Below is a snapshot of the data browser view of neo4j showing all the family members and their relationships.

![family graph]({{ site.url}}/images/neo4j-gremlin/family_graph.JPG)

In this blog I'm going to cover how to create the nodes and relationships to build the graph shown above and demonstrate how we can build queries to return certain information. I'm also going to cover writing your own Gremlin steps in Groovy to hide complex low level graph manipulation from other developers and allow them to work at a higher abstracted level. 

## Working with Nodes and Relationships
Let get started by looking at creating our nodes using Gremlin. Each node has two properties, one to hold the person's first name and the other to hold their surname. When I create a node I assign it to a variable. This saves me doing a lookup before I create the relationships.

![create a node]({{ site.url}}/images/neo4j-gremlin/node_create.JPG)

Now lets create some relationships for my node. 
 
![create a relationship]({{ site.url}}/images/neo4j-gremlin/relationship_create.JPG)

The following commands shows all the nodes and relationships which currently exist. 

![list nodes]({{ site.url}}/images/neo4j-gremlin/node_list.JPG)![list relationships]({{ site.url}}/images/neo4j-gremlin/relationship_list.JPG)

Once you've created your nodes and relationships you'll want to be able to retrieve them and find out information about them. If you know which node represents a person you can use the following command supplying the appropriate node number. The map function allows you to view the properties and verify you have the correct node.

![node properties]({{ site.url}}/images/neo4j-gremlin/node_property2.JPG)

You will probably be more likely to retrieve nodes based on their properties. In the following example I retrieve the node which represents me using the filter function and the criteria first_name property equals 'Heather'. Next I find out the relationships defined between my node the other nodes. outE retrieves the relationships where my node is on the left handside of the relationship e.g. Heather MOTHER_OF Luke and inE the relationships where my node is on the right handside of the relationship e.g. *Carolyn SISTER_OF Heather*. In a similar fashion outV retrieves the node on the left handside of the relationship and inV the node on the right handside
i.e. in the relationship *Heather MOTHER_OF Luke* Heather is the outV node and Luke is the inV node of the relationship.

![node properties]({{ site.url}}/images/neo4j-gremlin/node_property.JPG)

## Method Chaining
From that last example you've probably realized that Gremlin supports method chaining. This makes for some very succinct code. Each operation takes a collection as input and returns a collection as output.
The query below retrieves the first name of all the people who are related to me but have a different surname all neatly summed up in one line. 

![related but diff surname]({{ site.url}}/images/neo4j-gremlin/linked.JPG)

## Adding another Aspect
Currently our graph represents the relationships within my family but say I wanted to add another aspect to it and add interests it is as simple as adding some more nodes and relationships. No need to change how our existing family relations data is held. I just add my interests as nodes. Then define who likes them by creating a 'LIKES' relationship between a person node and an interest node. 

![interest nodes]({{ site.url}}/images/neo4j-gremlin/activities.JPG)

![relate interests]({{ site.url}}/images/neo4j-gremlin/activities_rel.JPG)

Now I can find the names of people who share the same interests as me.

![same interests]({{ site.url}}/images/neo4j-gremlin/activities_query.JPG)

## Creating Your Own Domain Specific Steps

You can create your own gremlin steps which are meaningful to your business domain. This allows you to hide low level complex graph traversal in a high level step. The example below defines a custom step to retrieve the family relationships for a person. You can see I'm ignoring relationships from the interests aspect.

![define domain specific set]({{ site.url}}/images/neo4j-gremlin/DSL_define.GIF)

This leads to a more meaningful and succinct command.

![result of DSS]({{ site.url}}/images/neo4j-gremlin/DSL_result.JPG)

## Updating and Deleting
Updating and deleting Nodes and Relationships is pretty straight forward. In the example below I add a property weight to the Heather LIKES horse riding relationship.Then I remove it.

![Update then delete]({{ site.url}}/images/neo4j-gremlin/MOD_DEL.JPG)

Hopefully this post has given you an introduction to the power of Gremlin. I found it intuitive to use and pretty easy to start writing my own queries and steps.
In my next post I'm going to look at Cypher, Neo4j's querying language. I'm going to demonstrate how we can carry out the actions and queries covered in this post using Cypher.
