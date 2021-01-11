# Airport Challenge

Airport Challenge is a collection of Ruby classes and unit tests developed to satisfy the requirements of a challenge set during the first week of the Makers Academy bootcamp.

## Installation

Use the Ruby package manager [Bundler](https://bundler.io/) to setup your environment after cloning the repository.

```bash
git clone git@github.com:Mornevanzyl/airport_challenge.git

gem install bundle

bundle
```

## Usage

```ruby
require './lib/airport'

airport = Airport.new # returns instance of Airport class

airport = Airport.new(30) # Airport class may be instantiated with any capacity (maximum number of planes), but will use DEFAULT_CAPACITY of 20 if no argument is recevied at instantiation. 

plane = Plane.new # returns instance of Plane class

plane = Airport.take_off # instantiates Plane class from within Airport class instance.

airport.land(plane) # allows a plane to land at the airport.
```

## Approach
I followed a strict [TDD](https://bit.ly/3q65B8q) approach to satisfying the requirements of this challenge. A systematic and iterative cycle of interpreting a series of user stories and developing feature tests/unit tests/feature implmentation/refactoring.

A brief review of all user stories revealed three protagonists: - Airport, Plane and Weather. The busiest class here was clearly going to be the Airport class.

In terms of how classes interact, I focused on allowing a ```Plane``` to ```#land``` and ```#take-off``` from an ```Airport``` along with a series of controls implmented to satisfy user requirements.

On the ```Airport``` class, I later implemented the ```#empty?``` and ```#full?``` and ```#already_landed?``` methods to contribute to a [SRP](https://bit.ly/2Xrxrzx) approach of my object implementation.

```Airport``` presently provides a public interface to the ```planes``` instance variable, an array used to store planes at the airport. I've enjoyed using this from ```irb``` to aid in feature testing. It will likely be a better practice to move this to private for final implementation.

Finally, the ```Airport``` class also exposes the ```#stormy?``` method used in many guard clauses. It's a simple solution, but will lend itself to be rolled into a larger ```Weather``` class in future.

I had some internal debates related to whether a concept like 'land' should exits on the Airport and/or Plane class. From an immediate functionality perspective it was clearly required on the Airport class, but I recognise the fact that it will likely be required on the Plane class in future, and potential conflicts on this existing on both classes will be addressed at a future junction.

## Suggested Improvements
This section outlines known/identified areas of improvement/optimisation that serve as input to future development of this project.

- Unit test have been developed/added on an iterative basis closely following the implementation of individual user stories. These can be revisited and grouped in a more optimal way.

- The Plane class has been implemented mostly to allow future expansion and allow it to logically form part of a larger aeronautical environment.

- The Airport class presently uses a simple randomised 'stormy' weather generator method to allow/disallow landing/take-off of planes. A more functional Weather component can be developed that allows re-use by other classes.

##  Acknowledgements/Appreciations
- I got stuck on getting my stubs working to override randomising of weather considtions. I jumped around [this](https://www.youtube.com/watch?v=Vg0cFVLH_EM) video published by [Sam Morgan](https://github.com/sjmog) to help me overcome this blocker. I'd like to watch the full video as it would be great to see how this challenge is met by a more senior/experienced software engineer.