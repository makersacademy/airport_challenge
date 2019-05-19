require 'airplane.rb'

class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def instruct_take_off
    @airport.pop.flying = true
  end
end