# Airport Challenge  
## Documents Organisation
* The Original README.md file containing the requirements of this challenge is renamed to Challenge_Instruction.md.  
*   Progess.md contains the snapshot of codes for each steps.
* Programme code in ./lib dictionary.  
* Unit test code in ./spec dictionary.

## Test Environment
* Feature tests : irb
* Unit test:  Rspec  

## How to Run

### Basic Functions.  
In the terminal, navigate and enter the programme directory.

* Run the programme in the REPL,  irb is recommended.   
> ➜  airport_challenge git:(master) irb


* require the programme file.
> require './lib/airport.rb'


* create instance of weather.  
> weather = Weather.new


* create instance of airport
	* with default airport capacity.      
	> airport = Airport.new(weather)

	* to set the capacity of the airport , you can use any positive integer.    
	> airport = Airport.new(weather,10)


* create instance of plane.  
> plane = Plane.new


* to land an plane
> airport.land(plane)      


* plane takeoff
	* take off the first plane in apron by default.    
	>   airport.take_off
	* take off by index.  
		* check the plane in apron.  
		> airport.airport_apron
		* index is the order of  plane in the apron started from 0.  
		> airport.take_off(2)


### Some Other features
Please feel free to explore:  

* there will be chances that weather be stormy (randomly).
* neither landing nor takeoff is allowed when weather is stormy.
* landing is not allowed when airport capacity is full.
* Mistakenly input that land the plane already in airport apron will be alert.
