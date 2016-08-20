# Creates plane objects for use with airport.rb class.
class Plane
  attr_reader :landed
  alias :landed? :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def takeoff
    @landed = false
  end
end
