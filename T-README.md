# Airport Challenge - T's README

## Plan

First off, grab the **specs** AND the **user stories**

1. Use the specs and user stories to design the tests
2. Use the tests to drive development


#### User Story Table
| Obj | Msg |
| :-: | :-: |
| Plane | land |
| | take_off |
| Airport | check_hanger |
| | hanger_capacity |
| | check_safe_weather |
| Weather | is_stormy |

## Plane

Make the plane with a true/false 1/0 variable, which correlates to whether or not the plane is flying

Change this variable as it uses the take_off or land methods

Does the class Plane need an identity argument? idk. Keep simple.

### make tests: 
- does the plane have a land method?
- does the plane have a flight method?
- use guard clauses to change the in_flight variable, only if they are applicable

### class Plane complete!

***

## Airport

Make an airport - similiar to boris-bikes, an array that stores Plane objects.

The airport must have a capacity - I forgot these arrays are not extensible - make an airport capacity as an argument

### Hanger Tests:
- does the airport have an hanger which returns an Array?
- we must check the airport.check_hanger return the Array.
- set a standard capacity for the hanger
- check the standard capacity can be changed on init
- a method to modify the hanger after init(use attr_accessor? idk, keep private)

The airport capacity must be changed *paraphrase* "as required?".  Create method to modify "build an extension" after the airport has been created.

- Had to a fiddle a little - was treating Ruby arrays like C arrays - fileld one with 40 nil objects, but its simpler to make a capacity and test against that in the code

- added a few methods to access the instance variables

- created guard clauses in the airports land and take_off methods also - I made them before I tested for them... whoops... they appear to work correctly, and i'll need to modify them later

- took me a while to find the way to return a specific item from a Ruby array, .delete - a little counter-intuitive

### Hanger Tests:

- make sure that the land_plane method, takes a plane instance, and pushes that instance into the @hanger array.

- ensure that take-off only happens for planes in the airports hanger

- then check that a plane in the hanger can take off

- check a plane, post take off, has left the airport. put a plane in the hanger, run airport.take_off(plane), and then check it is not in the @hanger array

- glad to see I can use string interpolation to return the memory address - not the cleanest way, but reimplementing would take time, and confuse things unnecessarily.

- need to add a method or functionality to confirm the plane has left the airport after takeoff

### Weather tests

#### User Story Table V.2
| Obj | Msg |
| :-: | :-: |
| Plane| land |
| | take_off |
| Airport | check_hanger |
| | hanger_capacity |
| | check_weather |

- the weather doesn't need to be a class - even though it looks like it

- initially had trouble setting up the false random methods, and even debated using srand().

- if (some logic) expect weather to be stormy - similiar for sunny.

- there's likely a better way to solve the weather implementation, but I'm thinking second guard-clauses on the take_off and land methods.

- as previously, expect stormy weather to raise "some_error", and implement that in the above guard statements

### Done

I think it went well - forgot about the {} for RSpec errors, which cost me some time.

Looking through the docs, there's a lot I could improve, and several of the tests could be outright deleted.
