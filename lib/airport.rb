class Airport
  AIRPORT_CAPACITY = 11
  attr_accessor :capacity, :plane

  def initialize(capacity = AIRPORT_CAPACITY)
    p @capacity = capacity.to_i
    @plane = "plane"
    @planes_in_airport = Array.new(capacity, "plane")
    # @plane = (@planes_in_airport[0])
  end

  def land
    fail "Cannot land at this airport as it is full" if @planes_in_airport.count >= capacity
    @planes_in_airport << @plane
    puts "There are now #{@planes_in_airport.count} planes in #{Airport}"
  end

  def take_off
    @planes_in_airport.pop
    puts "There are now #{@planes_in_airport.count} planes in #{Airport}"
  end
  
  # def full?
  #   @planes_in_airport.count >= @capacity
  # end
end
