require_relative './planes.rb'

class Airport
  attr_accessor :planes
  def initialize
    @planes = []
  end
end
