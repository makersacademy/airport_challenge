require_relative 'plain.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :planes

  def initialize
<<<<<<< HEAD
    @planes = []
  end

  def arrival(plane, airport_size)
    # weather_error if stormy == true
    fail 'airport is full' if @planes.length == airport_size
    @planes << plane
    @planes.length
  end

  def departure
    # weather_error if stormy == true
    @planes.pop
    @planes.length
  end
=======
    @plains = []
  end

  def arrival(plane, airport_size)
    fail "airport is full you can't land" if @plains.length == airport_size
    @plains << plane
    @plains.length
  end

  def departure
#                 \/  line17  above to fixed \/
    fail "no plane on airport to departure" if @plains.nil?
    @plains.pop if @plains.length != 0
    @plains.length
  end

  def weather_rand
    rand(100)
  end

>>>>>>> 83adffdc3fc7cd03d151b437fa1761688f263ad6
end
