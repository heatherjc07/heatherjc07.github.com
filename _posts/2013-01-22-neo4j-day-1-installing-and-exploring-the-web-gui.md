---
layout: post
title: "Neo4j Day 1 (Installing and Exploring the Web GUI)"
description: "Installing Neo4J"
category: development
share: true
tags: [seven databases in seven weeks, nosql, data, neo4j]
---

*My experience with Day 1 of [Neo4j](http://www.neo4j.org/) in [Seven Database in Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).*

I know technically the book suggests you work through the databases in the order in which they appear in the book but I was keen to try Neo4j so it was the first non relational database I installed on my machine. Neo4j is a graph database which makes it ideal for highly interconnected data. Data is represented as nodes, with associated properties, and relationships which connect nodes, which can also have properties.The book describes it as "whiteboard friendly" which basically means if you can represent the data on a white board as lines and boxes, Neo4j is ideal for holding it. It is suitable for a range of data set sizes. It is small enough to embed or you can cluster and handle 10s of billions of nodes and relationships.

## Getting Set Up 
Neo4j comes in three flavours, community, advanced and enterprise. The advanced and enterprise editions come with additional monitoring, clustering and online backup features. All three versions are available to download for trialling but if you want to include Neo4j in a closed source solution you need to get a commercial license. More information on the different versions and licensing can be found [here](http://www.neo4j.org/learn/licensing). Day three of the book covers enterprise functionality such as clustering and backups so you'll need the enterprise version.

On windows neo4j is available as a single click installation. If you need more detailed instructions or information on how to set it up as a Windows Service look [here](http://docs.neo4j.org/chunked/stable/server-installation.html).
Once you've got it installed you can start the database server by going into the bin directory of the install and typing
`neo4j start`

Neo4J comes with a nice web interface which makes getting started very easy. Open up your browser and type in the following URL: <http://localhost:7474/webadmin/>.

![console]({{ site.url}}/images/neo4j-setup/console.JPG)

## Neo4j Web Interface	

There are a number of tabs available that include: a dashboard view, a view to browse your nodes and relationships, a console which you can use to run commands and queries against your database, a view to manage your indexes and one to review your server properties. I'm going to focus on the data browser view in this post.

### Data Browser
Click on the data browser tab and the following screen is displayed.

![data browser]({{ site.url}}/images/neo4j-setup/data_browser.JPG)	
 
This screen allows you to quickly define nodes, relationships and their properties.In the screen shot above I've highlighted the search facility, node and relationship creation buttons and the button which allows you to switch to a graphical view.
If you click on the '+ Node' button a new node will be created and you will be taken to the following view where you can define properties and relationships associated with that node. There is also the ability to delete it if you have created it by mistake.
 
![add node]({{ site.url}}/images/neo4j-setup/db_nodes_add.JPG)

Clicking on the '+ Relationship' button displays the following form to define a new relationship. You specify the from and to node ids and give it a type. The type field is free text and should be a descriptive label for the relationship. There is a handy drop down of types currently in use. This allows you to select the type rather than having to type it in again. Reducing typing errors.

![add relationship]({{ site.url}}/images/neo4j-setup/db_relationship_add.JPG)

You can search for nodes and relationships using the search form up at the top left of the page.In the example below I've typed in 1 which returns the information for Node 1. Existing properties are displayed with the ability to edit or delete and additional properties can be added using the '+ Add Property' button. The whole node can be removed using the 'Delete' button. You can view existing relationships using the 'Show Relationships' button.
 
![show relationships for a node ]({{ site.url}}/images/neo4j-setup/db_nodes.JPG)				
 
The screen below is displayed on clicking the 'Show Relationships' button on the Node 1 screen. Each relationship is listed with it's id, start and end node and label. Clicking on a particular relationship allows you to drill in a specific relationship.

![Relationships Associated with a Node]({{ site.url}}/images/neo4j-setup/db_relationships.JPG)
			
Drilling down into relationship 0 allows us to view properties associated with it, add new properties and delete it completely.

![Search Results for a Relationship]({{ site.url}}/images/neo4j-setup/db_relationships.JPG)

Finally lets look at the graphical view for node 2. You can get a really clear view of the node and all the nodes associated with it. All the relationships involving the node are displayed along with their labels.

![graphical view]({{ site.url}}/images/neo4j-setup/data_graph.JPG)

By default the only text displayed for each node is its id. This isn't always particularly meaningful. My database is a graph of relations within my family with each node representing a family member. A more meaningful label for my nodes would include the person's first name and surname. In order to define this I click the style button on the graphical view. A drop down of existing profiles is displayed and a button to create a new profile. On clicking to create a new profile the following screen is displayed. In the label field I've add the first name and surname properties using the syntax {prop.prop_name}.

![define custom profile]({{ site.url}}/images/neo4j-setup/db_profile.JPG)

That's all for the data browser tab. My next couple of posts are going to look at CRUD operations using [Gremlin](https://github.com/tinkerpop/gremlin/wiki) and [Cypher](http://docs.neo4j.org/chunked/milestone/cypher-query-lang.html).

