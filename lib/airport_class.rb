class Airport

#airport set up
  attr_reader :hangar
  attr_accessor :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

#departing airport

  def take_off(plane)

  end

  def has_departed(plane)
    @hangar.include?(plane) ? false : true
  end

#landing at aiport

  def land(plane)
  end

  def full?
    @hangar.count >= @capacity ? true : false
  end

end
