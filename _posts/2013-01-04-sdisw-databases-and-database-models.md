---
layout: post
title: "SDISW: Databases and Database Models"
description: "Seven Databases in Seven Weeks"
category: tutorial
share: true
tags: [seven databases in seven weeks, nosql, data]
---

*This is a really brief post to introduce the databases and database models I'm going to take a look at while working through the book [Seven Databases in Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).*

## Relational Databases

Most of us are familar with [Relational Databases](http://en.wikipedia.org/wiki/Relational_database) where data is organised into two dimensional tables made up of columns and rows. We can query tables to return a particular set of information by joining them through common columns and applying certain conditions to limit the data returned. Structured Query Language is used to manage the data within relational database. Relational databases are great if query flexibilty is more important than schema flexibility.
 
**PostgreSQL**

PostgreSQL is the first database the book covers. It is an open source RDBMS.The book uses it as a baseline to allow us to compare NoSQL databases with relational databases.
 
## Key Value Databases

[Key Value](http://en.wikipedia.org/wiki/NoSQL) databases are a bit like maps and hashtables where data is stored and accessed via a key. There is no schema and no need for a fixed data model. Some key value databases support complex types like hashes and lists and some provide a means of iterating through keys. The benefit of this type of model is that it can be very performant in certain situations but is not useful if you need to generate complex queries or aggregate data. There are many options available but the book has choosen to cover Redis and Riak.

**Redis**

Redis supports complex data types like sorted sets and hashes. It also supports basic messaging patterns like [publish-subscribe](http://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern) and [blocking queues](http://tutorials.jenkov.com/java-concurrency/blocking-queues.html).It has a particularly robust query mechanism for a Key Value database. It has great performance because it caches writes to memory before committing to disk but the tradeoff is there is an increased risk of data loss if a failure occurs. It is a good choice for caching noncritical data and acting as a message broker.

**Riak**

Riak allows you to store a range of data as values from very simple text to complex XML. Relationships between keys are handled by named structures called links.It has intelligent data replication and retrieval which make it very fault tolerant. It is very scalable, as you add capacity you get a near-linear performance increase. Riak embraces web constructs like HTTP and REST with a rich API. It is a implementation of Amazon's [Dynamo](http://aws.amazon.com/dynamodb/).It is the first database in the book which supports advanced querying via mapreduce.

MapReduce is a framework to allow developers to write queries that process large amounts of unstructured data in parallel across a distrubuted cluster of servers. It was created by Google to index their web pages. It makes use of the parallel processing power of distributed systems and reduces bandwidth as the query is carried out where the data resides and the filtered data returned rather than retrieving all the data to the client and carrying out the filtering there.

The map function hands out the work to different nodes in the cluster. The reduce function collates the responses and resolves them into a single value.
It is fault tolerant. If a node in the cluster fails to report back with its result or status update in a predefined period of time the work is re-assigned to other nodes.

## Columnar Databases

I'm used to thinking of the storage of data in terms of rows as is the case with relational databases. [Columnar](http://en.wikipedia.org/wiki/Column-oriented_DBMS) databases store data for a given column together. What's the benefits of this? Well it means that the cost of adding a column is inexpensive as it is done on a row by row basis and it also means the cost of aggregating values or updating the values for a column is less than a relational database. However the cost of adding a row to a columnar database or retrieving the values for a large number of columns is greater than for a relational database. This highlights not only do you need to think about what data you are planning to store, you also need to think about how this data will be used. 

**HBase**

Created by Apache and based on their mapreduce engine Hadoop, HBase has tables, columns and rows so will probably be the most familiar feeling of the non relational databases covered in the book . It is based on Google's BigTable paper which describes Google's distributed storage system, designed to handle large volumes of data. It's versioning and compression support set it apart from it's competitors in the big data space. 

## Document Databases 

As the name suggests [Document](http://en.wikipedia.org/wiki/Document-oriented_database) databases are built to store document orientated data or semi structured data. The document is like a hash of information with id fields pointing to values. The value can be a nested structure. Documents can be retrieved by their id and the values they contain. The book suggests that their are bigger differences between the various document databases than some of the other database types. They take different approaches to things like indexing, adhoc querying,replication and consistency. Therefore in order to make the right choice you need to be aware of the differences and trade offs and find the right one for the structure of your data and how you intend to use it.

**MongoDB**

MongoDB is designed to handle large quantities of data. It doesn't support ACID transactions but you can do certain atomic read-write operations provided they are within the same document. MongoDB has a dynamic schema meaning all documents in a collection don't have to have the same fields. You use JavaScript to query it and it supports a range of queries from basic to complex mapreduce jobs. It's documents are stored in a JSON format. It places emphasis on ensuring it's data remains consistent.

**CouchDB**

As I found out while reading "Seven Languages in Seven Weeks" CouchDB is written in Erlang, one of the functional languages the book covered. It is designed to be highly available and aimed at a wide variety of deployment scenarios, from the datacenter to the desktop, on down to the smartphone. CouchDB’s native query language is JavaScript and uses JSON for it's documents. 

## Graph Databases 

[Graph](http://en.wikipedia.org/wiki/Graph_database) databases are ideal for storing highly interconnected data in an accessible manner. They are suited to managing adhoc and changing data.They are made up of nodes and the relationships between the nodes, both of which can have properties that store data.

**Neo4J**

Neo4J is ideally suited to intricately linked data. One common use is in social networking sites. It supports ACID transactions.

*In the following posts I'll write about what I've learnt each day and how I've approached the exercises set in the book.*

