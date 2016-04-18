class Plane
attr_accessor :location

  def initialize
    @location = nil
  end

  def landed?
    return true if !@location.nil? && @location != "in_the_air"
    false
  end

end
