---
layout: post
title: "MongoDB Day 1 (CRUD Part 2: Read)"
description: "Reading items in MongoDB"
category: tutorial
share: true
tags: [seven databases in seven weeks, nosql, data, mongodb]
---

*My experience of Day 1 with [MongoDB](http://www.mongodb.org/) in [Seven Databases In Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).*

In this post I'm going to look at querying MongoDB to find a particular document or set of documents which meet our criteria. I'm going to use the blogger database and articles collection I created in my previous blog about creating documents in MongoDB.

Here is a reminder of the structure of a typical blog document.

 ![document structure]({{ site.url}}/images/mongo-crud-read/find_docs.JPG)

I've add a few more documents to the database to give me something to search for. 

## Basic Find

The basic command for finding documents in my database collection is db.article.find(criteria) I'll use the pretty function throughout this blog to make my results more readable. First off lets search for a document based on it's unique `_id` value using the find command.We pass our search criteria as a JSON document. 
`{_id : ObjectId("Value")}`. The find command returns a cursor of matching documents. We're searching for a specific `_id` which is unique therefore the cursor will only have one document in it. Running the same command without any criteria would return all the documents in the collection.

 ![search by id]({{ site.url}}/images/mongo-crud-read/search_id.JPG)
 
You can include multiple criteria as comma separated name value pairs. The example below searches for a document with a name field of "Carolyn McCappin" and a title of "Excel Spreadsheets Rock". 

 ![search by id]({{ site.url}}/images/mongo-crud-read/search_id.JPG)

Another option if you only want to retrieve one document is the findOne command. This returns a single document rather than a cursor. If multiple documents match your criteria the document which is returned will be at random.

 ![find one]({{ site.url}}/images/mongo-crud-read/find_one.png)

## Controlling What's Returned 

We can add a second parameter to the find method to tailor the columns returned. Again this parameter takes the format of a JSON document of name value pairs. In the following example I'm specifying I just want the title returned (by default the `_id` field is returned unless you explicitly specify for it not to be.) 1 or true means include.

 ![return title]({{ site.url}}/images/mongo-crud-read/search_id_inc.JPG)

In this example I'm returning the name and title but explicitly excluding the `_id` field. 0 or false means exclude.

 ![exclude id]({{ site.url}}/images/mongo-crud-read/search_id_ig.JPG)

## Using Operators

You are not limited to matching specific values. MongoDB queries support a whole range of operators. You can find a list of them [here](http://docs.mongodb.org/manual/reference/operators/)
Using the $gt operator to match names greater than "H". The operators are included as a nested document.

 ![greater than operator]({{ site.url}}/images/mongo-crud-read/greater.png)

Using the $regex operator to match names which include "H"

![regex]({{ site.url}}/images/mongo-crud-read/regex.png)

We can combine conditions to limit the range of a field. For example if we wanted to find documents with a title greater than "E" and less than "F" we could use the following syntax.

![range]({{ site.url}}/images/mongo-crud-read/combo_cond.GIF)

## Array Fields 

The documents in the articles collection include an array field called tags which holds the tag values associated with the document. We can use the same operators with array fields as we use with single value fields. For example the following query returns documents whose tags field contains a value beginning with "s".
 
![array]({{ site.url}}/images/mongo-crud-read/array.png)

Sometimes you'll want to return documents based on a field containing multiple values. We use the $all operator to achieve this. In the example below we are searching for articles tagged with "scala" and "functional".
 
![all condition]({{ site.url}}/images/mongo-crud-read/all.png)

Other times you may want to return documents that match one or more values. We use the $in operator to achieve this. In the example below we are searching for articles tagged with "scala" or "functional".
 
![in]({{ site.url}}/images/mongo-crud-read/in.png)

## Nested Docs 

Finding documents based on nested document fields is straightforward. The documents in our collection contain a field called comments whose value is an array of nested comment documents.In the following example I retrieve documents which "Harold" has commented on. To access the name field of the documents nested within the comments array I use the dot notation "comments.name".
 
![nested]({{ site.url}}/images/mongo-crud-read/nested.png)

We might want to find documents which "Harold Potts" has commented on as being "Good" i.e. we want a document with a comments field containing a document with the name equal to "Harold Potts" and text containing "Good". The $elemMatch operator allows us to do this.

![element match]({{ site.url}}/images/mongo-crud-read/element.png)

Note the difference between this and just listing the field conditions, like in the example below where the name condition and text condition can belong to different comments in the same document and still be considered a match.

![element match 2]({{ site.url}}/images/mongo-crud-read/element2.png)

That was a quick look at some of the ways we can search for documents in our database. In my next blog I'll cover updating documents.
