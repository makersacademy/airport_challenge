require './lib/plane'

class Airport

  attr_reader :planes

  def initialize
    # array to store landed planes  
    @planes = [] 
  end

  def land(flight_number)
  
    @planes << Plane.new(flight_number)

  end

  def takeoff(flight_number)

    counter = 0

    # iterate over planes array
    @planes.each do | plane |
      # compare flight_number of each item in array with desired flight_number to takeoff
      if plane.flight_number == flight_number
        # if it matches
        # delete the plane from the array
        @planes.delete_at(counter)
        counter += 1
      end
    end

  end

end
