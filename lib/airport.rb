class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :planes, :permission, :stormy

def initialize(capacity=DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
end

def stormy

  if rand > 0.75
    @stormy = true
  else
    @stormy = false
  end

end

def permission

  stormy

  if planes.length >= capacity
    @permission = false
  elsif stormy == true
    @permission = false
  else
    @permission = true
  end
end

def instruct_to_land plane

  permission
  fail "Do not have permission to land" if permission == false
  plane.land
  @planes << plane

end

def instruct_to_take_off plane

  fail "Do not have permission to take off" if permission == false
  fail 'Plane not in airport' unless @planes.include? plane
  plane.take_off
  @planes.delete(plane)
end


end
