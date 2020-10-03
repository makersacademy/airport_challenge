class Airport
attr_reader :name, :planes_in_airport, :capacity

def initialize(name)
  @name = name
  @planes_in_airport = []
  @capacity = 5
end

def capacity_override(new_capacity)
end

end
