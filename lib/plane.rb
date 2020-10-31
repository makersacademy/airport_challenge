class Plane
  attr_reader :call_sign
  @@plane_id = 0

  def initialize
    @call_sign = create_call_sign
  end

  def create_call_sign
    three_random_letters = (0...3).map { (65 + rand(26)).chr }.join
    @@plane_id += 1
    three_random_letters + @@plane_id.to_s
  end

  def land(airport)
    raise StandardError.new("Airport is full!") if airport.planes.length >= airport.capacity
    
    airport.planes << self
  end
end