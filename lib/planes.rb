require './lib/airports.rb'

class Plane

  attr_accessor :position

  def initialize(position = "airbourne")
    @position = position
  end
end
