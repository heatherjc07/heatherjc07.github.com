---
layout: post
title: "MongoDB Day 1 (CRUD Part 3: Update)"
description: "Updating items in MongoDB"
category: tutorial
share: true
tags: [seven databases in seven weeks, nosql, data, mongodb]
---

*My experience of Day 1 with [MongoDB](http://www.mongodb.org/) in [Seven Databases In Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).*

In this post I'm going to look at the different ways we can update documents within a MongoDB collection.
In the collection I'm going to update is three documents each with `_id`, `name` and `profession` fields.

![data]({{ site.url}}/images/mongo-crud-update/data.GIF)

## Updating the Whole Document
Here is the document we're going to update. 

![before]({{ site.url}}/images/mongo-crud-update/completebefore.GIF)

If we do an update like the one below we replace the whole of the document rather than just updating the name and gender fields we've specified values for .

![after]({{ site.url}}/images/mongo-crud-update/completeafter.png)

## Updating a Field
In order to just update an individual field or set of fields we need to use the $set operator in our update command.
Here is the document before the update. 

 ![field before]({{ site.url}}/images/mongo-crud-update/fieldbefore.GIF)

I'm going to add a *gender* field with the value "female".

![field after]({{ site.url}}/images/mongo-crud-update/fieldafter.png)

## Removing a Field 
We can use the $unset command to remove the gender field.

![unset before]({{ site.url}}/images/mongo-crud-update/unsetbefore.GIF)

![unset after]({{ site.url}}/images/mongo-crud-update/unsetafter.GIF)

## Updating Arrays
There are lots of different operators for updating fields with array values.
We can add an individual value using the $push operator. 

![push]({{ site.url}}/images/mongo-crud-update/push.png)

$pop can be used to remove a value at the start or the end of an array. Supply 1 removes the last value.

![pop]({{ site.url}}/images/mongo-crud-update/pop.png)

-1 removes the first value.

![pop left]({{ site.url}}/images/mongo-crud-update/popleft.png)

$pushAll allows us to add multiple values provided as an array.

![pushall]({{ site.url}}/images/mongo-crud-update/pushAll.png)

$pull allows us to remove a specific value.

![pull]({{ site.url}}/images/mongo-crud-update/pull.png)

$pullAll allows us to remove multiple values. $addToSet treats the array like a set only adding a value if it is unique. The first time we call the command the array does not contain "sausages" so it is added. The second time it does so the array is left unchanged.

![addToSet]({{ site.url}}/images/mongo-crud-update/addToSet.png)

Compare this to using the $push operator which adds "sausages" even though it already exists.

![push duplicate]({{ site.url}}/images/mongo-crud-update/pushdup.png)

We can update a specific array element using the $set operator and dot notation. array access begins at 0.

![set]({{ site.url}}/images/mongo-crud-update/array.png)

## Upsert
There may be occasions when you don't know if a document exists or not. We can supply a third parameter to the update function. This is the upsert flag. If we set it to true it means the document will be created if it does not exist or updated if it does. In the example below the first time we issue the update command their is no matching document so it is inserted. The second time there is so the existing document is updated.

![upsert]({{ site.url}}/images/mongo-crud-update/upsert.png)

## Updating Multiple Documents
By default an update command will only update one document. If your criteria matches multiple documents the document updated will be selected at random.

![updating multiple]({{ site.url}}/images/mongo-crud-update/multi1.png)

Adding in a forth parameter to the update command and setting it to true, sets the multi flag and means that all matching documents are updated.

![updating multiple2]({{ site.url}}/images/mongo-crud-update/multi2.png)

That completes my brief look at updates in MongoDB. In my final blog on CRUD in MongoDB I'll look at removing documents from a collection.
