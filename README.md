First Maker's Academy Friday challenge - Airport challenge.

https://github.com/makersacademy/airport_challenge 

To start with I have tried to keep the number of classes small as I understand this better however I do realise that this isn't best practice and will try to incorporate dependency injection. I plan to do this by firstly revisiting Boris_Bikes as I only got up to challenge 21 which meant that I never used mixins, which is something I think I could use here by incoporating the plane into the airport. I again realise that this isn't best practice as if someone changed the plane it would affect the airport. I have now created more classes 
    so that the behaviour of my aiport class is reduced. Still need more work on mixins.

https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master 

2.2.3 :001 > airport = Airport.new
=> #<Airport:0x007fc73b031308 @capacity=50, @planes=[], @weather=#<Weather:0x007fc73b0312e0>> 
2.2.3 :002 > plane = Plane.new
=> #<Plane:0x007fc73b021c00> 
2.2.3 :003 > weather = Weather.new
=> #<Weather:0x007fc73c803e40> 