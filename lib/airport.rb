require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane)
    raise("The plane can't land as there's a storm") if stormy?
    raise("#{plane} is already in the hanger") if @hanger.include? plane
    @hanger << plane
  end

  def takeoff(plane)
    raise("The plane can't take off as there's a storm") if stormy?
    raise("#{plane} is not in the hanger") unless @hanger.include? plane
    @hanger -= [plane]
    "#{plane} has left the hanger!"
  end

  private
    def stormy?
      Weather.new.stormy == 5
    end

end
