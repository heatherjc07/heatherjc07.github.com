---
layout: post
title: "MongoDB Day 1 (Intro)"
description: "Introduction to MongoDB"
category: tutorial
share: true
tags: [seven databases in seven weeks, nosql, data, mongodb]
---

*My experience of Day 1 with [MongoDB](http://www.mongodb.org/) in [Seven Databases In Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).*

As I mentioned in a previous post I'm currently working through [10gen's](http://www.10gen.com/) DBA and Developer courses for MongoDB along with the book [Seven Databases In Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks). This post is a quick intro to MongoDB, giving you some background on the type of database it is, explaining how to get it installed and looking at the format of the documents stored in it.

MongoDB is a [JSON](http://www.json.org/) document db, where documents are stored in a binary form of JSON, BSON.
JSON is a format built on two structures.

1. A collection of name/value pairs
1. An ordered list of values in an array like format.

Below is an example of a MongoDB document. You can see the collection is held in {}. The tags and comments values are arrays. tags is an array of strings while comments is an array of documents. This demonstrates an important feature of MongoDB, it supports hierarchy. You can have documents nested within your documents. This is something you can't achieve in a relational database.

{% gist 5322470 blog.json %}

One of the issues people often talk about with Relational Databases is the mismatch between how the database and their code represents data. Hence the need for ORM tools like Hibernate and iBatis and the Java Persistence API. With MongoDB you'll notice a more similar feel to how you represent data in the database to your code. The collection of name/value pairs it like a class and it's properties. The ordered list of values feels like an array.

Documents with a similar purpose are grouped into a collection. Which if you are coming from a relational background is a bit like a table except that the documents in the collection can vary in structure. This is because MongoDB is schemaless. With a relational database you would define a schema upfront before inserting records by creating tables and constraints. With MongoDB you just insert your documents into a collection and there are no checks for a particular set of fields. For example the three documents below could all be added to the database as part of the same collection even though they have different fields.

{% gist 5322470 people.json %}

Although there is no explicit schema when you write code to interact with your database it needs to be aware of the structure of the data so it knows what fields to query in other words there is still an implicit schema. The flexibility of this approach is in keeping with the increase in popularity of dynamic languages and an agile approach to development.

MongoDB supports the concept of indexes. When you insert a document it generates a field called `_id` which acts like the primary key of the document and is unique.You can also define your own indexes on a field or multiple fields of a particular collection of documents.

If you've worked with a relational database you're probably used to writing queries with joins between tables to pull back the information you require. MongoDB doesn't support joins. In some cases this will mean information is stored multiple times against different documents. Generally if you want to normalise the data and keep it in it's own separate document you can get round the lack of joins by storing it's unique `_id` field as a field of the documents which are associated with it.

E.g. in the example below you could retrieve the person record and then using the value stored in the country field do a second query to retrieve the country record. 

{% gist 5322470 insert.js %}

In general this approach should be sufficient but where you want to embed documents from multiple collections in documents from one collection there are DBRefs. More information about them can be found [here](http://docs.mongodb.org/manual/applications/database-references).

MongoDB doesn't have the idea of a transaction which allows you to update multiple documents in an atomic fashion. Generally this isn't an issue as unlike a relational database where data is often held across multiple tables in MongoDB it is normally held within one document. The update of a single document is atomic. If you need to update multiple documents take a look at the two phase commit pattern described [here](http://docs.mongodb.org/manual/tutorial/perform-two-phase-commits) which uses a transaction collection to replicate the behaviour of a transaction in the relational sense.

Full instructions for getting MongoDB set up can be found [here](http://docs.mongodb.org/manual/installation). I've been working in a Windows environment, running it manually.

That was a very quick high level introduction to the database. In my next post I'm going to cover CRUD in MongoDB. 

