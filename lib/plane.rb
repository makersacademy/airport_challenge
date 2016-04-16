class Plane
attr_accessor :location

  def initialize
    @location = nil
  end

  def landed?
    if @location != nil
      true
    else
      false
    end
  end

end
