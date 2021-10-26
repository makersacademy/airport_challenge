class Plane
  
  attr_reader :on_ground

  def initialize
    @on_ground = false
  end

  def report_location(status)
    @on_ground = status
  end

end
