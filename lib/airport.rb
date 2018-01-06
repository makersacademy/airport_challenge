require_relative './plane.rb'

class Airport

  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane)
    raise("#{plane} is already in the hanger") if @hanger.include? plane
    @hanger << plane
  end

  def takeoff(plane)
    raise("#{plane} is not in the hanger") unless @hanger.include? plane
    @hanger -= [plane]
    "#{plane} has left the hanger!"
  end

end
