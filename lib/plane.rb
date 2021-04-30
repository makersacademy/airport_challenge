# planes can only take off from airports they are in;
# planes that are already flying cannot take off and/or be in an airport;
# planes that are landed cannot land again and must be in an airport, etc.

class Plane

  def initialize
    @landed = true
  end

  def landed?
    @landed
  end

end
