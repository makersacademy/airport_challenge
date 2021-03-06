require 'airport'

class Plane

  attr_accessor :name, :location

  def initialize(name = 'concord', location = 'air')
    @name = name
    @location = location
  end

  def land

  end

  def take_off
    @location = 'air'
  end

end
