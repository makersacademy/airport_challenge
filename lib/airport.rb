require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :stormy

  def initialize(capacity = DEFAULT_CAPACITY)
    @bay = []
    @capactiy = capacity
  end

  def overwrite_capacity
    puts "How many planes can be stored in bay? Currently.
    The maximum capacity is: #{@capactiy}"
    @capactiy = gets.chomp.to_i
  end

  def bay_count
    "There are #{@bay.length} planes currently in the bay"
  end

  def stormy?
    number = rand(1..10)
    number > 8
  end

  def land(plane)
    @plane = plane

    fail "Cannot land in STORMY weather" if stormy?

    fail "Cannot land when airport is full" if @bay.length >= @capactiy

    fail "Plane has already landed" if @bay.include?(@plane)

    @bay << @plane
    "#{@plane} has landed at the airport"
  end

  def take_off
    fail "Cannot take off in STORMY weather" if stormy?

    fail "There are no planes in the airport" if @bay.length.zero?

    plane = @bay.sample
    @bay.delete(plane)
    "#{plane} has left the airport"
  end

end
