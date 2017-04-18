Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.

**My Part of the README**

The first problem I ran into was  a gemfile error. My ruby version did not match up  with the gemfile version. I recently switched rbenv(I’m told it’s more sophisticated than rvm) so I could remember how to install a different version of ruby. By using `rbenv install -l` and picking the required ruby version, which in this case was ruby 2.4.0 – I was able to complete the first step of getting past this error.  

However, I had completely forgotten that I needed to switch my ruby version after installing, thus I was absolutely dumbfounded when I tried to run `bundle` again and received the exact same error as before. After listing my ruby versions, I went to the aid of google and search on how to change my system ruby version.  

This all however turned out to be quite a good experience as I not only learnt how to globally change my ruby version but also in shell and in local projects. This knowledge could turn out to be useful in the future.

After all of this, I was finally ready to start my first weekend challenge at Makers, the moment I’ve been anticipating for what seemed like a while now. I read the instructions, cloned the repo  and started off… and I soon become extremely confused on what I was trying to actually do so I rage quit.  Now before coming into this, I thought a little higher of myself in terms of bloom’s taxonomy on TDD, I stood corrected after my first attempt at this challenge.

I spoke to my friend, who’s a software developer in the US that also went through a coding bootcamp. I explained to him my frustrations of TDD and my problem of getting into the habit of trying to implement everything at once. He told me that he knew exactly what I meant and that I should start getting into the groove writing down checklists of requirements or steps. To go along with this he suggested I should look into using Trello.

I found Trello easy to use, it removed the mental block as I was easily able to break large features down to smaller parts  by mapping things out. It has many cool features like being able to create different columns separate parts of the project and have things like “todo”, “in progress” and “done”.  Although it might seem a bit silly to use this in a small assignment like this, I’m pretty sure this program will be useful once I’m a software developer and I’m working on large and complex projects.
