class Airport
  attr_reader :plane

  def arrive(plane)
    @plane = plane
  end

  def depart(plane)
    @plane = 'The plane is no longer in the airport.'
  end





end


# User story 1:

# instruct a plane to land at an airport
# confirm that it has landed

# User story 2:

# instruct a plane to take off from an airport
# confirm that it is no longer in the airport
