class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity
  attr_reader :plane
  attr_reader :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    weather = rand(20) + 1
    if weather >= 15
      @weather = 'STORMY'
    else 
      @weather = 'GOOD'
    end
  end

  
  def land(plane)
    fail 'Landing prevented; hanger is full' if full?
    fail 'Landing denied; storms overhead' unless @weather == 'GOOD'
    @hanger << plane
  end
  
  def take_off(plane)
    fail 'No planes ready to take off' if empty?
    fail 'Take off denied; storms incoming' if @weather == 'STORMY'
    @hanger.delete(plane)
  end

  def check_hanger
    @hanger
  end

  def check_weather
    @weather
  end

  private

  
  def full?
    @hanger.count >= @capacity ? true : false
  end

  def empty?
    @hanger.empty?
  end

  def set_weather
    self.instance_variable_set(:@weather, 'GOOD')
  end

end

class Plane

  
end