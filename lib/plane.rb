require_relative 'airport'

class Plane

  attr_accessor :passengers

  def initialize
    @passengers = rand(100..250)
  end

  def passengers?
    @passengers
  end
end
