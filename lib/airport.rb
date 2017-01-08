class Airport

  attr_reader :planes
  #
  # DEFAULT_CAPACITY = 20
  #
  # def initialize(capacity = DEFAULT_CAPACITY)
  #   @planes = []
  #   @capacity = capacity
  # end

  def land(plane)
    (weather == "sunny") ? true : false
  end

  def landed?
    self.land == true ? true : false
  end

  def take_off
    (weather == "sunny") ? true : false
  end

  def departed?
    self.take_off == true ? true : false
  end

private

  def weather
    Weather.new.status
  end



end
