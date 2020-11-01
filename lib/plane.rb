class Plane
  attr_reader :call_sign, :airbourne
  @@plane_id = 0

  def initialize(airbourne = false)
    @call_sign = create_call_sign
    @airbourne = airbourne
  end

  def land(airport)
    landing_error_checks(airport)
    airport.planes << self
    @airbourne = false
  end

  def take_off(airport)
    take_off_error_checks(airport)

    airport.planes.delete(self)
    @airbourne = true
  end

  private
  def take_off_error_checks(airport)
    raise StandardError.new("Plane can't take off from an airport it's not in!") if !airport.planes.include?(self)
    
    raise StandardError.new("Too stormy for a takeoff.") if airport.current_weather == 'stormy'
  end

  def landing_error_checks(airport)
    raise StandardError.new("Plane is already on the ground!") if !@airbourne

    raise StandardError.new("Stormy conditions are preventing a landing.") if airport.current_weather == 'stormy'
    
    raise StandardError.new("Airport is full!") if airport.planes.length >= airport.capacity
  end

  def three_random_letters
    (0...3).map { (65 + rand(26)).chr }.join
  end

  def create_call_sign
    @@plane_id += 1
    three_random_letters + @@plane_id.to_s
  end
end