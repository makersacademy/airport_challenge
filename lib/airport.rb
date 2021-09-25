# airport - have capacity, be full
# airport - default capacity that can be overridden
# airport - no take-offs permitted when weather is stormy
# airport - no landings when weather is stormy

=begin
class Airport
  def initialize(capacity = 10)
    @capacity = capacity
    hangar = []
  end

  def take_off(plane)
    hangar.delete(plane)
  end

  def land(plane)
    hangar.append(plane)
  end

  def weather
    x = rand(1..2)


=end