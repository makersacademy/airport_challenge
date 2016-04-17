require_relative 'plane'

class Airport
  attr_accessor :apron

  def initialize
    @apron = []
  end

  def confirm_landing(plane)
    plane.landed
    @apron << plane
    @apron
  end

  def confirm_takeoff
    @apron.pop.takeoff
    @apron
  end

private

  def full?
  end
end
