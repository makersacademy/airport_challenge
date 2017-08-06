require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACTIY = 20
  attr_reader :onground, :inair, :capacity

  def initialize(capacity = DEFAULT_CAPACTIY)
    @onground = []
    @inair = []
    @capacity = capacity
    @stormy = Weather.new.stormy?
  end

  def land(plane)
    raise "it's too stormy to land!" if @stormy == true
    raise "sorry, the airport is full" if full?
    raise "this plan has already landed!" if @onground.include?(plane)
    @onground << plane
  end

  def take_off
    raise "it's too stormy to take off!" if @stormy == true
    raise "there are no planes to take off!" if @onground.count.zero?
    @inair << @onground.pop
    # delete_at(index_no)
  end

  def full?
    @onground.length >= @capacity
  end

end
