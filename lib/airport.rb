require_relative 'plain.rb'

class Airport

  def initialize
    @stormy = true
    @plains = []
  end

  def arrival(plane, airport_size)
    fail 'airport is full' if @plains.length == airport_size
    @plains << plane
    @plains.length
  end

  def departure
    @plains.pop
    @plains.length
  end

  def weather
    fail 'departure unavaible its stormy'
  end


end
