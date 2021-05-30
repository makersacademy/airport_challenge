require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :hanger, :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 1

  def initialize
    @hanger = []
    @capacity = DEFAULT_CAPACITY
    @weather = Weather.new
  end

  def land_plane(plane)
    if @weather.stormy? == :sunny && full? != :full
      @hanger << plane
    elsif full? == :full
      fail 'The airport is full'
    elsif @weather.stormy? == :stormy
      fail 'The weather is stormy'
    end
  end

  def release_plane
    fail 'The weather is stormy' if @weather.stormy? == :stormy
    
    @hanger.pop
  end

  def empty?
    @hanger.empty? ? 'There are no planes in the hanger' : 
    "There are #{@hanger.count} planes in the Airport"
  end 

  def full?
    @hanger.count >= @capacity ? :full : :not_full
  end

end
