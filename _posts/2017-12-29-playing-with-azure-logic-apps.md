---
layout: post
title: "Playing with Azure Logic Apps"
description: "Steps from setting up very basic app using Azure Logic Apps"
category: tutorial
share: true 
tags: [Azure, Logic Apps]
---

After reading [Azure Serverless Computing Explained in less than 5 minutes](https://blogs.msdn.microsoft.com/ranand12/2017/12/18/azure-serverless-computing-explained-in-less-than-5-minutes-lessthan5min/) I decided to have a play about with [Azure Logic Apps](https://docs.microsoft.com/en-us/azure/logic-apps/) myself. Logic Apps gives you a designer and a set of defined actions and conditions that you can use to build your workflow. 

I based my workflow on the one desribed in the post:

* Check Outlook periodically to see if an email has arrived from a particular email address with 'Photo Test' in the subject.
* Retrieve the attachment and store it on a file share
* Determine age of the people in the photo using [Face API](https://azure.microsoft.com/en-gb/services/cognitive-services/face/) 
* Send email to my account with subject 'Photo Fun' and the age in the body of the email

This involved the following steps:

**Subscribe to Face API**

Subscribe to Face API which can be found under Cognitive Services. There is a free tier. Note down your keys which can be found under Resource Management.

![family tree]({{ site.url}}/images/logic-apps/FaceAPI.png)

**Setup File Storage**

Set up a storage account and within that a file share and folder to store the images. At the storage account level generate a [shared access signature](https://docs.microsoft.com/en-us/azure/storage/common/storage-dotnet-shared-access-signature-part-1). Note down the one for file share.

![family tree]({{ site.url}}/images/logic-apps/FileShare.png)

![family tree]({{ site.url}}/images/logic-apps/SAK.png)

**Create a Logic App** 

Create a new Logic App. In the Logic App Designer select the action 'When a new email arrives'. You'll need to login to Office 365 to authorize it. In advanced options add the from and subject line criteria. Make sure you select 'yes' for 'include attachments'

Add another action. Search on Azure FileSystem and select 'Create File' and use attachments from last action as input. Configure to use the storage you set up and the attachment name as the image name.

Add another action. Search on Face API and select 'Detect Face' and use attachments from first action as input. In the image url specify the url to the folder within the file share, select the name property from the input and add a '?' followed by the shared access key.

Add the final action 'Send email' which uses output from 'Detect Face' as input. Configure to send an email back to yourself. In the body I sent the age property from the input. 

![family tree]({{ site.url}}/images/logic-apps/LogicApp.png)

**Testing**

Once the logic app is saved you can test it by selecting to run from the top menu bar. In your notifications you'll see a message to indicate that the trigger has been checked. If you click on that you can see if it has run successfully or not.

![family tree]({{ site.url}}/images/logic-apps/Status.png)

If you send an email which meets the requirements and it runs as expected you'll receive an email with the age of the person in the picture and the image will be loaded to your file share.

If it doesn't run succesfully you can click on the failed status to see why it wasn't succesful. The information provided made it easy to debug. You can see where it fails, the inputs, outputs and any error messages.

![family tree]({{ site.url}}/images/logic-apps/failure.png)

![family tree]({{ site.url}}/images/logic-apps/error.png)



