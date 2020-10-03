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

def land_plane
end


end
