class Airport
attr_reader :name, :planes_in_airport, :capacity

def initialize(name)
  @name = name
  @planes_in_airport = []
  @capacity = 5
end

def capacity_override(new_capacity)
  if new_capacity.class == Integer
    @capacity = new_capacity
  else
    "Capacity not updated.  Method only accepts integers.  Please retry"
  end
end

def storm_decision
  decision = gets.chomp
  decision
end

def storm_landing(plane)
  print "There is a storm. Do you want the plane to land yes or no:"
  if storm_decision == "yes"
    @planes_in_airport << plane.name
  elsif storm_decision == "no"
    "#{plane.name} did not land."
end
end

def land_plane(plane, weather)
end


end
