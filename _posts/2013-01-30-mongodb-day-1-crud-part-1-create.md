---
layout: post
title: "MongoDB Day 1 (CRUD Part 1: Create)"
description: "Creating items in MongoDB"
category: tutorial
share: true
tags: [seven databases in seven weeks, nosql, data, mongodb]
---

*My experience of Day 1 with [MongoDB](http://www.mongodb.org) in [Seven Databases In Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).*

In my previous post I talked about some of the features of MongoDB. In this post I want to look at creating a database with collections and documents. I'm going to take the very unoriginal approach of creating a database to store blog articles. The 10gen dev course takes you through building a blog using MongoDB and Python and [Seven Databases In Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks) has this as a homework exercise.

The first thing we need to do is start MongoDB by opening up a command prompt and using the `mongod` command in the bin directory of our install. Once the server has started up we can interact with it via the command line interface which comes with MongoDB. In a second command prompt go to the bin directory of the install and type `mongo`. This will take you into the MongoDB Command Line. By default if you don't specify a database it use the *test* database. We're going to use a database called *blogger*. As we're already in the Command line I'll create and switch to the blogger database by typing the command use blogger.

![create db]({{ site.url}}/images/mongo-crud-create/create_db.JPG)

Another option would have been to use `mongo blogger` to start up the command line. In both instances MongoDB creates the database if it doesn't already exist, otherwise it just sets it to the database in use so any further commands we run will run against it. Now lets create our first document.We create a document using the insert command. 

![insert document]({{ site.url}}/images/mongo-crud-create/insert_doc.JPG)

In the command above I'm adding the document to a collection called `articles`. MongoDB will create this collection if it does not already exist. My document is made up of lots of name value pairs. My tag field is an array of strings and my comments field is an array of nested documents which represent the comments people have made about the article.
To verify the articles collection exists run the following command.

![view collections]({{ site.url}}/images/mongo-crud-create/view_collections.JPG)

Our articles collection and the system collection system.indexes are returned.
As there is only one document currently in the articles collection I can retrieve it using the find command without specifying any criteria. I've used the pretty command to make the result easier to read.

![find docs]({{ site.url}}/images/mongo-crud-create/find_docs.JPG)

I want to create multiple documents with the same structure so to reduce the amount of code I need to write I'm going to create a JavaScript function to create my blog entries. The Mongo shell is a JavaScript Shell so I can just type my function in and start using it.
Here is the function.

![insert function]({{ site.url}}/images/mongo-crud-create/insert_function.JPG)

And here is an example of using it.
 
![use function]({{ site.url}}/images/mongo-crud-create/use_function.JPG)

I can prove the document has added correctly using the find command with the condition title is Fun with Haskell.

![find doc]({{ site.url}}/images/mongo-crud-create/find_doc.JPG)

That's the basics of creating a database, collection and documents covered. In my next post I'll look at searching for documents.



