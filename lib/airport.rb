require './lib/plane.rb'
require './lib/weather.rb'

class AirPort

attr_reader :hanger
attr_accessor :capacity
DEFAULT_CAP = 5

  def initialize(capacity = DEFAULT_CAP)
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    raise "Its too stormy to land" unless good_weather?
     raise 'This plane is has already landed' unless plane.flying
       raise 'No room at airport' unless room_in_hanger?
         plane.landed_plane
         @hanger << (plane)
  end

  def take_off(plane)
    raise "Its too stormy to take-off!" unless good_weather?
      raise 'This plane is not landed here' unless self.hanger.include?(plane) && !(plane.flying)
        plane.starts_flying
        @hanger.delete(plane)
  end


  def room_in_hanger?
    @hanger.length < @capacity
  end

  def good_weather?
    Weather.new.stormy? != true
  end
  
end

# irb -r './lib/airport.rb'