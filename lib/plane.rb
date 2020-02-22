class Plane

  attr_reader :location
  attr_reader :status

  def initialize(location = "in air", status = "flying")
    @location = location
    @status = status
  end
end
