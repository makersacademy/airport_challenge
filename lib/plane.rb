class Plane
  def initialize(name = 'airplane')
    @name = name
    @airport = nil
  end

  def make_airport(airport)
    @airport = airport
  end

  def take_off
    fail "The weather is too stormy to take off" if airport.stormy?
    puts "#{name} took off from #{@airport.name}"
    @airport = nil
  end

  def land(airport)
    fail "The weather is too stormy to land" if airport.stormy?
    make_airport(airport)
    puts "#{name} landed at #{@airport.name}"
  end

  def airport_name
    return nil if @airport.nil?
    @airport.name
  end

  attr_reader :name

  attr_reader :airport
end
