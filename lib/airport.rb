class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :planes

  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
    # @weather = Weather.new
  end

  def change_capacity quantity
    @capacity = quantity
  end

  def land plane
    fail 'Airport full - cant\'t land!' if full?
    plane.land self
    @planes << plane
  end

  def full?
    @planes.length >= 20
  end

  def take_off plane
    plane.take_off
    @planes.delete plane
  end

  # private

  # def its_stormy?
  #   @weather.stormy?
  # end
end
