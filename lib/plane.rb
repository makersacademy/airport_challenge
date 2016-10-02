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
  end

  def fly
   @status = :Flying
  end
end
