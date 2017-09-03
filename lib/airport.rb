class Airport

  def initialize(weather: Weather.new)
  end

  DEFAULT_CAPACITY = 6

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end


  def land

  end


  def full?
    fail 'airport is full' if @planes.count >= 6  #planes or plane?
    @planes << plane
  end


  def take_off
    fail 'Cannot take off in stormy weather' if weather.stormy?
  end


  def full?
    @planes.count >= 6
  end

  private

    def planes
      @planes
    end


    attr_reader :weather


end
