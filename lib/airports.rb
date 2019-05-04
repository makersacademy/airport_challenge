require_relative './planes.rb'

class Airport
  attr_accessor :planes
  def initialize
    @planes = []
  end

  def stormy?
    rand(10) + 1 < 3 ? true : false
  end
end
