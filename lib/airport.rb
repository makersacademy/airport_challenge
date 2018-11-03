require_relative 'plain.rb'

class Airport

  def initialize
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

end
