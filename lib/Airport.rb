class Airport
  CAPACITY = 3
  attr_accessor :plane

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def bad_weather?
    true if @weather.forecast == "stormy"
  end

  def land_plane(plane)
    raise 'Airport is full' if full?
    raise 'Weather is stormy, cannot land' if bad_weather?

    @planes << plane
    @planes.last
  end

  def take_off
    raise 'Weather is stormy, cannot take off' if bad_weather?
    raise 'That plane is not here' if empty?

    @planes.pop
  end

private
  def full?
   if @planes.length >= CAPACITY
      true
     else
      false
     end
  end

  def empty?
   if @planes.length.zero?
      true
     else false
    end
  end
end 
