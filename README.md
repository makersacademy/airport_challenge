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

#Task

We were asked to write a program to control the flow of planes at an airport.

I aimed to complete this challenge in a Test Driven manner, using manual feature tests within IRB and automated unit tests using RSpec.

We were given user stories, which I first broke down using domain modelling. My resulting models were then converted into failing feature tests, then translated into RSpec as failing unit tests. Following that, I wrote my code.

Care has been taken to ensure encapsulation was done as much as possible, so that the user (air traffic controller) can only interact with an instance of the Airport class.

#Installation

Clone repository.
```
$ git clone git@github.com:nazwhale/airport_challenge.git
$ cd airport_challenge
```

Install dependencies with bundle.
```
$ gem install bundler
$ bundle install
```

<!-- ## README is updated

Please do update your README following the [contribution notes](https://github.com/makersacademy/airport_challenge/blob/master/CONTRIBUTING.md), i.e.
* Make sure you have written your own README that briefly explains your approach to solving the challenge.
* If your code isn't finished it's not ideal but acceptable as long as you explain in your README where you got to and how you would plan to finish the challenge.

The above is a relatively straightforward thing to do that doesn't involve much programming - I'll often get it done while thinking about other problems in the back of my mind :-)

* http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme

## Instructions in README
It's a great idea to show the full story of how your app is used (from a user's perspective) in the README, i.e. a code example or irb transcript

```
$ irb
2.2.3 :001 > airport = Airport.new
 => #<Airport:0x007fafdb81ea88 @capacity=1, @planes=[], @weather=#<Weather:0x007fafdb81ea60>>
2.2.3 :002 > plane = Plane.new
 => #<Plane:0x007fafdb0041b8>
2.2.3 :003 > airport.land(plane)
 => #<Airport:0x007fafdb81ea88 @capacity=1, @planes=[#<Plane:0x007fafdb0041b8>], @weather=#<Weather:0x007fafdb81ea60>>
2.2.3 :004 >
``` -->
