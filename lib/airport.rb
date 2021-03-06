require 'plane'

class Airport

  attr_accessor :name, :hangar

  def initialize(name = 'heathrow', hangar = [])
    @name = name
    @hangar = hangar
  end

end
