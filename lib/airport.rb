require_relative 'plane'

class Airport

CAPACITY = 100
attr_reader :planes
attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = CAPACITY
  end

  def land plane
    'Incoming plane for landing.'
    plane.landing
    planes << plane
  end

  def release_plane
    plane = planes.find{ |plane| plane.landed?}
    plane.take_off
    planes.pop
  end

  def instruct_take_off
    plane = planes.find{ |plane| plane.landed?}
    "#{plane} is instructed to take off."
  end

  # def instruct_landing

  # end


  def full?

  end
end
