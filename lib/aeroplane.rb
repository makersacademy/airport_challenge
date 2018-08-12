class Aeroplane
  attr_accessor :status, :location

  def initialize(status = "airborne")
    @status = status
    @location = nil
  end
  
  def grounded?
    @status == "grounded"
  end

  def airborne?
    @status == "airborne"
  end
end
