class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :hangar

  def initialize(capacity = DEFAULT_CAPACITY,weather)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise 'Stormy weather! Do not land!' if stormy?
    raise 'Hangar full! Do not land!' if full?
    plane.land
    @hangar << plane
  end

  def take_off(plane)
    raise 'Stomy weather! Do not take off!' if stormy?
    plane.take_off
    @hangar.delete(plane)
  end

    private

    def stormy?
      weather.stormy?
    end

    def full?
      @capacity == @hangar.length
    end


end