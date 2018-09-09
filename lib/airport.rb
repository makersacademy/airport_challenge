require_relative 'plane'

class Airport

attr_reader :store, :weather
attr_writer :store, :weather

  def initialize
    @store = []
    @weather = ["Sunny", "Stormy"] #remember to put in more values
  end


  def land_plane(plane)
    @store << plane
  end

  def take_off(plane)
    @store.delete(plane)
    print "#{plane} has taken off"
    #return @store
  end

  def forecast
    @weather[rand(@weather.length)]
  end


  def is_it_safe(weather)
     return "Unsafe" if weather == "Stormy"
     return "Safe" if weather == "Sunny"
  end



end
