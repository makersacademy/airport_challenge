# Airport Challenge

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

The aim was to build a small program based on the following user stories:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## Process
### Domain Model
The first step was to isolate all the nouns and verbs which would prove useful when designing the classes:

| Nouns           | Verbs/Adjectives                                         |
| :------------   | :-------------                                           |
| <code>Airport</code>         | <code>instruct</code> <code>confirm</code> <code>prevent</code> <code>default</code> <code>overridden</code> <code>full</code>    |
| <code>Plane</code>           | <code>take off</code> <code>land</code>                                           |
| <code>Weather</code>         | <code>stormy</code>                                                   |

Eventually I decided to break down <code>'instruct'</code> into two actions: <code>'commission_flight'</code> and <code>'harbour_plane'</code>, 
to best reflect real-world intent.  After implementation I found these names contributed to the readability of the code.<br/><br/>

The verb <code>'prevent'</code> appeared regularly in the user stories, which gave me the idea to create an <code>Errors</code> class 
(given the single responsibility of holding error messages as strings), and <code>'confirm'</code> seemed to insinuate the use of a 
boolean at some stage.<br/><br/>

The adjectives <code>'default'</code> and <code>'overridden'</code> appear in the context of an airport having a capacity; an airport 
should not be able to accept any more planes if there is no space on the hangar. I realised this meant that each <code>Airport</code> 
instance would need an attribute <code>@capacity</code> with a default assignment.  Perhaps the default could be 100, the average 
aircraft capacity of a decently sized airport?<br/><br/>

I needed to consider how an Air Traffic Controller (ATC) could verify whether a plane was present on the airport hangar, as well as 
verify when a plane is airborne.  I decided that giving each plane an instance variable <code>@airborne</code> would suffice, as each 
instance of a plane would need this logic to prevent the situation where <code>land</code> is called on a plane while grounded, or 
<code>take_off</code> while a plane is in mid-flight.<br/><br/>

Weather did not need to be complex; in order to fulfil the needs of the user stories, an airport would simply need to know whether it was 
safe to fly.  I decided on a <code>weather_report</code> method, which would have a slight chance of returning <code>'stormy'</code> but 
would otherwise report <code>'clear'</code>.  Only an airport would need to know this information, as it decides whether a plane is cleared to land, 
so I figured Weather could work perfectly as a module for the <code>Airport</code> class.

---------------------

### Unit Testing
The next step was to begin to write tests for classes.  By this point I was aware I needed <code>Airport</code>, <code>Plane</code> and 
<code>Errors</code> classes, as well as a <code>Weather</code> module.  Some of my earlier 'it-statements' checked for the existence of 
methods on a class, but as the testing progressed I was able to remove them, as their purpose was accounted for in the wording of other 
tests.<br/><br/>

After creating files for each class (and their relative specs), the aim was to check for the following logic:<br/><br/>
  
| Class/Module                    | Test Logic                      |
| :-------------                  | :-------------                  |
| <code>Airport</code>            | • should only hold instances of the <code>Plane</code> class<br/>• should only hold grounded planes (not airborne planes)<br/>• should have a default capacity which can be overridden<br/>• should not allow planes to takeoff or land in stormy weather<br/>• should not contain the commissioned plane once it has taken off<br/>• should not be able to commission a flight for any plane not currently on the hangar<br/> |
| <code>Plane</code>              | • should be airborne after take off<br/>• should not be airborne after landing<br/>• should be accounted for at an airport<br/>• should not be able to land once grounded<br/>• should not be able to take off in mid-air<br/> |
| <code>Weather</code>            | • should report whether the weather is safe for flights |
| <code>Errors</code>             | • should inform users of the software why any particular operation is not viable |

<br/>
I used mocks and doubles to isolate all the Unit Tests from eachother, though I included the <code>Plane</code> class in the 
<code>Airport</code> spec to test that everything in the hangar was infact a plane.  <code>Errors::NOT_A_PLANE</code> will be raised 
whenever a foreign object attempted to land on the airport hangar.<br/><br/>

#### Results

Using a test driven approach, I was able to achieve all the logic above.  The <code>Plane</code> class was responsible for taking off and 
landing, as well as knowing its registration status via the <code>@accounted_for</code> attribute on each instance, set to <code>true</code> 
upon its first official arrival at any airport.<br/><br/>

I had already decided on using a <code>@capacity</code> instance variable on the <code>Airport</code> class, eventually deciding on 
storing the functionality of the <code>Weather</code> module on an instance variable also.  All an airport is responsible for is commissioning flights and harbouring planes, which kept the class structure lean and considerably easier to understand than anticipated.  The plane needed a hangar to manage its fleet, so the <code>@hangar</code> took the form of an array – a straightforward solution to achieving expected behaviour.

--------------------

### Feature Test
#### <code>class Sky</code>
I wanted to write a test which simulated the journey a plane would take from one airport to another.  Attempting a feature test made me realise the need for a space to store planes which were in mid-flight, an airspace between the start and endpoints of its journey.  I decided to tackle this issue by adding one more simple class, <code>Sky</code>, whose sole purpose is to hold planes in transit between airports.<br/><br/>

When trying to implement this new class, I realised any two airports would need to keep track of the same airspace for planes to successfully complete a journey between them.  After outlining the problem with tests in the <code>Airport</code> spec, my solution was to include one more instance variable on an airport instance, <code>@airspace</code> – this allows airports to be instantiated with knowledge of a particular airspace, share existing airspaces (instances of <code>Sky.new</code> saved to variables), and anticipate inbound planes.

Another test I realised needed to be in place for this new class was one which ensures all planes in the sky were in fact airborne. I defined a matcher to this effect:

    RSpec::Matchers.define :all_be_airborne_planes do
      match do |actual|
        actual.all? { |planes| planes.airborne == true }
      end
    end
    
which worked well, and mirrored my <code>all_be_grounded_planes</code> matcher for the <code>Airport</code> class (a similar check was needed.)<br/><br/>

#### 'Given, When, Then..'
With all this in place, I attempted to write a feature test which simulates a flight between the Gatwick and Schiphol airports.  I used 'Given', 'When', 'Then' syntax in comments to structure the test:

    # given a plane is signed off to travel,
    # when a plane takes off,
    # then it should travel through the sky,
    # and safely land at its destination.

The feature test can be seen in <code>spec/features/flights_spec.rb</code>
