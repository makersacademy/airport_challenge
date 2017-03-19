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

### Task

We were asked to write a program to control the flow of planes at an airport.

I aimed to complete this challenge by using a test-driven approach, using manual feature tests within IRB and automated unit tests using RSpec.

We were given user stories, which I first broke down using domain modelling. My resulting models were then converted into failing feature tests, then translated into RSpec as failing unit tests. Following that, I wrote my code.

Care has been taken to ensure encapsulation was done as much as possible, so that the user (Air Traffic Controller) can only interact with an instance of the Airport class.

### Installation

Clone repository:
```
$ git clone git@github.com:nazwhale/airport_challenge.git
$ cd airport_challenge
```

Install dependencies with bundle:
```
$ gem install bundler
$ bundle install
```

### Domain model

Functional representation:

| Objects                  | Messages                 |
| ------------------------ | ------------------------ |
| Air Traffic Controller   |            |
| Plane                    | plane_lands         |
| Airport                  | land           |
| Plane                    | plane_takes_off          |
| Airport                  | take_off            |
| Plane                    | flying?          |
| Stormy Weather           | prevent_take_off         |
| Stormy Weather           | prevent_landing         |
| Airport                  | full?           |
| Airport                  | default_capacity          |

Diagram of communication between objects and messages:

```
Plane          <--- plane_lands      ---> plane status no longer flying
Airport        <--- land             ---> plane lands
Plane          <--- plane_takes_off  ---> plane status flying
Airport        <--- take_off         ---> plane takes off
Plane          <--- flying?          ---> true/false
Stormy Weather <--- prevent_take_off ---> prevents take off
Stormy Weather <--- prevent_landing  ---> prevents landing
Airport        <--- full?            ---> true/false
Airport        <--- default_capacity ---> default capacity
```

<!-- ## README is updated

* If your code isn't finished it's not ideal but acceptable as long as you explain in your README where you got to and how you would plan to finish the challenge.

## Instructions in README
It's a great idea to show the full story of how your app is used (from a user's perspective) in the README, i.e. a code example or irb transcript -->
