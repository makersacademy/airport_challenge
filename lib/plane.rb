require_relative "airport1.rb"

class Plane
  def initialize
    @in_air = 'flying'
  end

  def change_status(status)
    @in_air = status
  end


  attr_accessor :in_air

end
