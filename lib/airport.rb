require_relative 'plane'

class Airport

  def land(plain)
    @plain = plain
  end

  def take_off
    fail "Elvis has left the bulding" unless @plain
    @plain
  end


end
