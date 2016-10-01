require_relative 'plane.rb'

class Airport

  attr_reader :terminal
  attr_accessor :stormy

  def initialize(stormy=false)
    @terminal = []
    @stormy = stormy
  end

  def weather(boolean)
    @stormy = boolean
  end

  def land(plane)
    @terminal << plane
    puts "The plane has landed"
  end

  def take_off(plane)
    @terminal.pop
    puts "The plane has departed"
  end



end
