require_relative 'plane'

class Airport

  attr_accessor :weather, :name

  def initialize(name = "the Airport")
    @name = name
    rand(1..10) >= 9 ? @weather = "Stormy" : @weather = "Sunny"
  end

end
