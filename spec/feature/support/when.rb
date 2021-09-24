def when_the_plane_lands
  p 'when_the_plane_lands'
  @airport.land_plane(@plane)
end

def when_the_plane_takes_off
  p 'when_the_plane_takes_off'
  @airport.take_off(@plane)
end

def when_the_airport_is_at_capacity
  p 'when_the_airport_is_at_capacity'
  20.times { @airport.land_plane(AeroplaneFactory.build) }
end

def when_the_airport_is_at_the_custom_capacity(capacity)
  p 'when_the_airport_is_at_the_custom_capacity'
  capacity.times { @airport.land_plane(AeroplaneFactory.build) }
end

def when_the_plane_tries_to_take_off
  p 'when_the_plane_tries_to_take_off'
  @airport.take_off(@plane)
end

def and_a_plane_tries_to_land
  p 'and_a_plane_tries_to_land'
  @plane = AeroplaneFactory.build
  @airport.land_plane(@plane)
end

