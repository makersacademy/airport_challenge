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

My Approach
-------
I used the TDD cycle to write my code, starting at the most basic level of running RSpec on a spec file and using that to determine the class I create etc.

As I got further in the task the tests became more specific and helpful in informing which code needed to change. It also helped me refactor my code and other tests as my functionality increased, I was able to run better tests.

It was my first time using rubocop, but it was very helpful in showing me where I had made little code quality mistakes.

It was also the first time I have come across code coverage, which I had to do some reading on. It makes sense to see if there is any code that is not being used in testing. I had a few lines come up as not covered, so I checked each one individually. Some of them I decided there should be a test for, others I decided were unnecessary repitions of other code so I removed them.
