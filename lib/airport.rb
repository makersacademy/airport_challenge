require_relative 'plane'

class Airport
    attr_reader :name

  def initialize(name)
    @name = name
    @planes = []
  end

  def land 
    "plane has landed at #{@name}" 
  end

  def take_off
    "plane has taken off from #{@name}"
  end
end
