class Plane
  attr_reader :call_sign
  @@plane_id = 0

  def initialize(airbourne = false)
    @call_sign = create_call_sign
    @airbourne = airbourne
  end

  def create_call_sign
    @@plane_id += 1
    three_random_letters + @@plane_id.to_s
  end

  def land(airport)
    landing_error_checks(airport)
    airport.planes << self
  end

  def take_off(airport)
    airport.planes.delete(self)
  end

  def landing_error_checks(airport)
    raise StandardError.new("Airport is full!") if airport.planes.length >= airport.capacity

    raise StandardError.new("Plane is already on the ground!") if !@airbourne
  end

  def three_random_letters
    (0...3).map { (65 + rand(26)).chr }.join
  end
end