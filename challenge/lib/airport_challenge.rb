require_relative 'plane'
#Require relative plane is necessary as instances of plane will put into the airport
class Airport
  DEFAULT_CAPACITY = 10
  #USER_STORY4: As a system designer, I would like a default airport capacity that can be overridden as appropriate
  #Adding a constant for capacity and putting it in the argument initialize to value of a variable means its able to be overriden easily. e.g subject = Airport.new(20)
  attr_accessor :airport, :plane, :amount_of_planes
  #attribute readers allows us to call for instances variables outside the class.
  def initialize(amount_of_planes = DEFAULT_CAPACITY)
    @airport = []
    @amount_of_planes = amount_of_planes
  end
#USER_STORY1: As an air traffic controller, I want to instruct a plane to land at an airport
  def land(plane)
    #This method will push the instance of Plane and push it
    #into the array airport. You can see if this plane is in there by typing
    #subject.airport
    if @airport.count == amount_of_planes
      #USER_STORY3: As an air traffic controller, I want to prevent landing when the airport is full
      #This raises an error if the Airport has reached capacity.
      raise 'Airport is FULL!'
    end
    @airport.push(plane)
    @plane = plane
  end

#USER_STORY2: As an air traffic controller I want to instruct a plane to take off from an airport,
#confirm that it is no longer in the airport
  def take_off
    #The function .pop, releases the last index of the array.
    @airport.pop
    #This method returns a  string confirms the instance of Plane has left
    #airport array
    return "Plane has taken off and no longer in the airport"
  end
end
