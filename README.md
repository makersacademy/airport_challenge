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
I took the following steps in solving this challenge.

Steps
-------

* I created an `Plane` class and gave it methods that changed it's landed state
* I created a  `Airport` class that instructed the planes on whether or not they could land
* The `Airport` class was also had methods for checking whether a given plane was currently in the airport
* In order to simulate a random weather condition, I created a `Weather` class
* The weather class generated an array seeded heavily with good weather conditions `sunny` and giving it a 5% chance of `stormy` weather
* There is a public method in the weather class `.stormy?` that told you weather the weather was stormy or not
* I added calls to this `stormy?` method to the `can_take_off?` and `can_land?` to prevent planes from taking off when the weather is stormy
* I added a `DEFAULT_CAPACITY` to the `Airport` class and methods to help prevent planes from landing when the `Airport` is `at_capacity?`
* There was a big conceptual argument as to whether the `Plane` lands in the `Airport` or if the landing was to be initiated by the `Airport`.
* I decided to go for the second option to prevent unnecessary complexity in my code as it was perfectly possible to get it work without that
* I did a whole lot of refactoring when HOUND was done with my code
* I added a capacity optional argument that can be added to the `initialize` method in the `Airport` class. This allowed for the added flexibility of changing the capacity of the `Airport` either at creation or later on expansion
