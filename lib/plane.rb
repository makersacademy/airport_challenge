class Plane
  attr_accessor :status
  attr_accessor :current_airport

  def initialize
    @status = "landed"
  end

  def fly
    self.status = "flying"
  end

  def land
    self.status = "landed"
  end

  def flying?
    status == "flying"
  end

  def landed?
    status == "landed"
  end

  def assigned_airport(airport)
    self.current_airport = airport
  end

end
