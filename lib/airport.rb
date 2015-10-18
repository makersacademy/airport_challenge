require_relative './weather.rb'

class Airport

  include Weather

  attr_reader :name, :planes, :capacity

  DEFAULT_CAPACITY=10

  def initialize name, capacity=DEFAULT_CAPACITY
    @name=name
    @planes=[]
    @capacity=capacity
  end

  def full
    @planes.length>=capacity ? true : false
  end

end