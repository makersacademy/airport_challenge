class Plane
attr_accessor :location

  def initialize
    @location = nil
  end

  def landed?
    if @location != nil && @location != "in_the_air"
      true
    else
      false
    end
  end

end
