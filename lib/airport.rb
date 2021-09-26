# frozen_literal_string: true

require 'plane'

class Airport
  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane)
    raise 'Airport is full' if hanger.count >= 3

    hanger.push(plane)
  end

  def take_off
    hanger.pop
    'the plane is now airborn'
  end
end
