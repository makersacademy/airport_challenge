class Plane

  attr_reader :location, :status
  attr_writer :location, :status

  def initialize(airport)
    @location = airport
    @status = 'landed'
  end
end
