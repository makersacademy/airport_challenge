# Airport Challenge

[Task](#task) | [Approach](#approach) | [[Support](#support)]

The task was to make our airport program based on these user stories. This was writing
a control flow program for planes at an airport. Below, are the following user stories.

### <a name="task">Task</a>

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

What a great way to start of the first weekend challenge at Makers.
I didn't get far, only up to the point of "ensuring safety to prevent take off
when weather is stormy" (I attempted this test though but failed to finish).
The stubs got me.

### <a name="approach">Approach</a>

My first thought to this problem was to imagine as if I was building a new airport.
Conceptually, this helped me keep focus whilst during my venture into the tasks.

#### Domain Models
Given the User's feedback, I changed them into domain models to understand what the
elements of the test were, and the test I was going to do along with its specifications.

This file is known as DOMAINMODELS.md

#### Unit tests & Feature tests
Speaking out what each test does for the unit test helped me understand what was
needed. I split the feature tests in chronological order of what I was testing.
I put the "responsive method" tests in one section and the other test action
in a different section.

When it came to the weather section, I manage to feature test & unit test the
function of the .sample method. However, I did not get far after that.


### <a name="Support">Support</a>

https://github.com/thatdania/airport_challenge/blob/master/docs/review.md (Airport Challenge Code review)
https://apidock.com/ruby/Array/delete_at (How to delete from an array)
https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/type-matchers (Using to_be_an_instance_of)
https://ruby-doc.org/core-2.2.0/Array.html#method-i-sample (How to do a random generator)
https://www.rubypigeon.com/posts/rspec-core-cheat-sheet/ (The idea of let in unit tests)
