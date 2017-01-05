---
layout: post
title: "Creating a Custom Annotation"
description: "Creating a customer annotation in Java"
category: tutorial 
share: true
tags: [JSR303,java,validation]
---

JSR 303 provides a set of built-in validations but there will be times when you need to create your own validation annotation. Thankfully the specification was written with that in mind and it is relatively simple to write a custom validation annotation.

A typical scenario could be that we want to validate that two passwords entered by the user match.

## Defining the Annotation

{% gist 5224957 Matches.java %}

We use the @interface keyword to define an annotation. 

There are certain attributes and annotations we must define in order to satisfy the specification.
 + an attribute "message" that returns the default key for creating error messages in case the constraint is violated
 + an attribute "groups" that allows the specification of validation groups, to which this constraint belongs This must default to an empty array.
 + <code>@Target({ METHOD, FIELD, ANNOTATION_TYPE })</code>: Says, that type declarations and annotation declarations may be annotated with @Matches (but not method or field declarations e.g.)
 + <code>@Retention(RUNTIME)</code>: Specifies, that annotations of this type will be available at runtime by the means of reflection
 + <code>@Constraint(validatedBy = MatchesValidator.class)</code>: Specifies the validator to be used to validate elements annotated with @Matches
 + Documented: Says, that the use of @Matches will be contained in the JavaDoc of elements annotated with it
 
## Implementing the ConstrainValidator
 
The next step is to implement the ConstraintValidator that will validate classes with the <code>@Matches</code> annotation

{% gist 5224957 MatchesValidator.java %}

The ConstraintValidator interface specifies two type parameters, which we set in our implementation. The first specifies the annotation type to be validated by a ConstraintValidator (in our example Matches), the second the type of elements, which the validator can handle (we're expecting an object). Specifying object means we don't limit the validation annotation to a particular type. MVEL is used to inspect the properties of the object being validated. If we specified a particular type we could use the fields accessor methods.
The implementation of the validator is straightforward. The initialize() method gives us access to any attributes of the annotation. In this case we're expecting the name of the password field (field) and the match password field. (verifyfield)

The isValid() method determines whether the two fields match. If they do the @Matches annotation is satisfied. If they are not an exception is raised using the default message.

Note, that the specification recommends, that null values should be declared to be valid. If null is not a valid value for an element, it should be annotated with @NotNull explicitly.

## Specifying the Error Message

Next we need to specify the error message. To do so, we create a file named ValidationMessages.properties under src/main/resources with the following content:

{% gist 5224957 ValidationMessages.properties %} 

## Using Our New Annotation

We can now use the @Matches annotation on our CreateUserAccountForm class to verify the password and passwordRepeat fields match.

{% gist 5224957 CreateUserAccountForm.java %}

## Testing the New Constraint
 
We can then write a simple junit test to check our new constraint

{% gist 5224957 MatchesTest.java %}