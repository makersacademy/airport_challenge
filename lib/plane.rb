class Plane

  attr_reader :status

  def initialize
    @status = 'flying'
  end

  def land
    fail "You're already on the ground pilot" if @status == 'landed'
    @status = 'landed'
  end

  def take_off
    @status = 'flying'
  end

end
