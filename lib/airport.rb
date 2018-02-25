require_relative 'plane'

class Airport

  def take_off
    fail 'No planes available' unless @plane
    @plane
  end

  def land(plane)
    @plane = plane
  end

# this is an attribute reader, i.e. read the @plane attribute on an instance
  # def plane
  #   @plane
  # end

# shorthand to write the method above
  attr_reader :plane

end
