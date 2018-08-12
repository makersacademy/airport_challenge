class Aeroplane
  attr_accessor :status, :location
  
  def initialize(status = "airborne")
    @status = status
    @location = nil
  end
end
