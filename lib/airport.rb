require_relative 'plane'

class Airport

  attr_reader :hanger
  attr_accessor :capacity
  DEFAULT_CAPACITY = 1

  def initialize
    @hanger = []
    @capacity = DEFAULT_CAPACITY
  end
 
  def land_plane(plane)
    if weather == :sunny && full? != :full
      @hanger << plane
    elsif full? == :full
      fail 'The airport is full'
    elsif weather == :stormy
      fail 'The weather is stormy'
    end
  end

  def release_plane
    fail 'The weather is stormy' if weather == :stormy
    @hanger.pop
  end

  def empty?
    @hanger.empty? ? 'There are no planes in the hanger' : 
    "There are #{@hanger.count} planes in the Airport"
  end 

  def full?
    @hanger.count >= @capacity ? :full : :not_full
  end

  def weather
    rand(10) <= 9 ? :sunny : :stormy
  end

end
