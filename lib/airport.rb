require_relative 'plane'

class Airport

  attr_accessor :weather

  def initialize
    @weather = rand(10)
    @planes = []
  end

  def weather_type
    @weather <= 8? 'sunny' : 'stormy'
  end

  def land plane
    fail 'Stormy weather. Try later' if self.weather_type == 'stormy' #WHEN DO WE USE SELF?
    fail 'No capacity at airport' if full?

    @planes << plane
  end

  def take_off # NOT SURE HOW TO TEST FOR THIS ONE
    fail 'No planes to take off' if @planes.lenght == 0
  end



private

  def full?
    @planes.count >= 20
  end  






end
