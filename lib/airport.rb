
class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @airport_deposit = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise Exception.new if full?
    return @airport_deposit << plane
  end

  def take_off(plane)
    @airport_deposit.delete(plane) if @airport_deposit.include?(plane)
  end


  private

  def full?
    @airport_deposit.length >= @capacity
  end
end
