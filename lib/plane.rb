require 'airport'

class Plane

  attr_reader :name
  attr_accessor :location, :ground

  def initialize(name = 'EZY123')
    @name = name
    @location = 'Sky'
    @ground = false
  end

end
