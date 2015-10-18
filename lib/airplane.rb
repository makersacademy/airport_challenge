require_relative 'airport'

class Airplane

  attr_reader :airport

  def initialize
    @airport=airport
  end

  def land
    raise 'airplane is already in airport' unless flying? == false
    airport = Airplane.new
  end

  def take_off
    raise 'airplane is in flight and cannot take off' if flying?
    airport
  end

  def flying?
      if true
        airport==nil
      else
        airport=Airplane.new
      end
  end
end
