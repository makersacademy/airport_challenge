class Airport
  attr_reader :name, :planes_in_airport, :capacity

  def initialize(name)
    @name = name
    @planes_in_airport = []
    @capacity = 5
  end

  def capacity_override(new_capacity)
    return "Capacity must be an integer" if new_capacity.class != Integer
      @capacity = new_capacity
  end

  def storm_decision
    # decision = gets.chomp
    # decision
  end

  def storm_landing(plane)
    print "There is a storm. Do you want the plane to land yes or no:"
    # if storm_decision == "yes"
  end

  def land_plane(plane)
    if plane_already_in_airport(plane) == true
      print "Cannot land plane as it is already in the airport"
    else
      if @capacity == @planes_in_airport.count
        print "Airport full cannot land plane"
      elsif @capacity > @planes_in_airport.count
        @planes_in_airport << plane.name
      end
    end
  end

  def plane_already_in_airport(plane)
    @planes_in_airport.include?(plane.name)
  end

  def take_off(plane)
    @planes_in_airport.delete(plane.name) { "Plane cannot take off as it is not in the airport" }
  end

end
