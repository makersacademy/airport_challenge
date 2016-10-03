require_relative 'airport'

class Plane

  attr_accessor :passengers

  def initialize
    @passengers = rand(100..250)
    @status = :Flying
  end

  def passengers?
    @passengers
  end

  def status
    @status
  end

  def land
    @status = :Landed
    @passengers = 0
  end

  def fly
   @status = :Flying
   @passengers = rand(100..250)
  end
end
