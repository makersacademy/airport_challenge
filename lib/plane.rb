require_relative './weather'

class Plane
  attr_accessor :landed

  def initialize
    @landed = nil
  end
end
