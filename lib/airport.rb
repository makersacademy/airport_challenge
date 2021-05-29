require_relative 'plane'

class Airport

  attr_reader :hanger
  attr_accessor :capacity

  def initialize
    @hanger = []
    @capacity = 1
  end
 
  def land_plane(plane)
    if weather == 'Sunny' && full? != 'Full'
      @hanger << plane
    elsif full? == 'Full'
      'The airport is full'
    elsif weather == 'Stormy'
      'The weather is bad'
    end
  end

  def release_plane
    weather == 'Sunny' ? @hanger.pop : "The weather is bad, you cant take off"
  end

  def empty?
    @hanger.empty? ? 'There are no planes in the hanger' : 
    "There are #{@hanger.count} planes in the Airport"
  end 

  def full?
    @hanger.count >= @capacity ? 'Full' : 'Not full'
  end

  def weather
    rand(10) <= 9 ? 'Sunny' : 'Stormy'
  end

end
