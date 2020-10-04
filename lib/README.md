### Airport Challenge ###
Partial entry
- I tried to build too much complexity into the ability of the ATC to control landing/take off during a storm.  Too much time was spent on this which caused a delay in the other requirements.  The storm aspect is not complete as a result so landing/taking off is not currently affected by weather.  As outlined below testing user input was causing issues so this aspect was put to one side.
- Also not complete is the requirement for planes not to land in multiple airports at one time.  

### Running the program from IRB
- Navigate to the airport_challenge folder
- require 'Airport.rb' / 'Weather.rb' / 'Plane.rb'
- Create new classes
    airport = Airport.new("airport name")
    plane = Plane.new("plane name")
    weather = Weather.new
- Methods which can be used on the following classes

Airport
- .capacity_override(integer)
- .name
- .planes_in_airport
- .capacity
- .storm_landing(plane) **incomplete**
- .land_plane(plane)
- .plane_already_in_airport(planes)
- .take_off(plane)

Plane
- .name

Weather
- .weather_outcome

#### Approach
Following the RGR process for addressing the specifications of the program so tests were always created first before code was written.  My approach was the following  

- 1. Create tests for classes, then created 3 classes: Airport, Plane and Weather
- 2. Test and build weather class.  Create the weather generator code and test  using the stub to test the generator.  Probability of storm was set too low so this has to be corrected.
- 3. Test and build Plane class
  - My thinking was that most of the methods would be required in the airport class so the plane class would require less code. My assumption is this is not correct as each plane would probably need to store their own status e.g. in air or in airport.
-  4. Test and build airport class.  
  - Difficulties: my intention was to enable an ATC to make a decision if there was a storm to allow planes to land or take off.  This was one of the first things I tried to build and the tests did not work based on user input.  The tests would run but would expect user input to press return in order for the tests to continue to run.  After spending too much time trying to debug this I disabled those tests (but left them in the code as comments in the airport_spec file).  I then moved on to test and code more of the specs and edge cases.  
  - When landing planes / taking off the plane name was placed in the array which would probably conflict with the requirement for planes to only land in one airport at a time where the instance ID would possibly be required.  The solution here would probably be for the planes to be contained within an array of hashes / or a hash, enabling each instance to have different attributes saved.    
  - Improvements: fewer if statements, remove gets.chomp for storm landing/taking off override, encapsulate more.  

#### Initial code plan
- Before building tests I tried to outline a plan for the various classes as below.  
- As tests were built the below code had to be changed.
- Weak areas: too many if statements which could be simplified, not encapsulated enough

class Plane
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Weather
  def random_number
    rand(7)
  end

  def weather_outcome
    if random_number <= 5
      "Sunny"
    elsif random_number == 6
      "Storm"
    end
  end

end

class Airport
  attr_reader :capacity, :name, :planes_in_airport
  attr_writer :capacity

  def initialize(name)
    @name = name
    @planes_in_airport = []
    @airport_capacity = 5
  end

  def capacity_overrride(new_capacity)
    @capacity = new_capacity
  end

  def storm_landing(plane)
    puts “There is a storm. Do you want the plane to land yes or no: “
    choice = gets.chomp
    if choice == "yes" || choice == "Yes"
      @planes_in_airport << plane.name
    elsif choice == "no" || choice == "No"
      puts "#{plane} did not land. #{@plane} still in the air."
    end
  end

  def land_plane(plane, weather)
    if @array.includes?(plane)
      "plane is already at airport"
    else
      if @planes_in_airport.count >= @capacity
        "airport capacity reached"
      elsif @planes_in_airport.length < @capacity && weather == "Sunny"
        @planes_in_airport << plane.name
      elsif @planes_in_airport.length < @capacity && weather ==     "Storm"
        storm_landing(plane)
      end
    end
  end

  def take_off(plane, weather)
    if @planes_in_airport.includes?(plane) && weather == "Sunny"
      @planes_in_airport.delete(plane)
      "#{plane} has taken off.  Planes in airport: #{@planes_in_airport}"
    elsif weather == "Storm"
      storm_landing
    end
  end

 def weather_status(weather)
   weather.weather_outcome
 end

end

hamburg = Airport.new("HAM")
this = Plane.new("Boeing")

hamburg.print_planes_in_airport
