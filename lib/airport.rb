class Airport
  #SETUP
  attr_reader :airport_capacity, :airplanes_on_ground
  AIRCRAFT_HANGERS = 10

  def initialize(capacity=10)
    @airport_capacity = capacity
    @airplanes_on_ground = []
  end

  #LANDING

  def land_at_airport(plane)

  end

  def landed?

  end


  #TAKE OFF
  def take_off

  end


end
