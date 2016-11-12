class Aeroplane
  attr_reader :confirm_landed, :confirm_taken_off

  def initialize
    @confirm_landed = true
    @confirm_taken_off = true
  end

  def land
    confirm_landed
  end

  def take_off
    confirm_taken_off
  end

end
