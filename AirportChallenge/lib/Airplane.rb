
class Airplane
  attr_reader :name_or_number, :flying

  def initialize(name_or_number)
    @name_or_number = name_or_number
    @flying = true
  end

  def plane_land
    @flying = false
  end

  def plane_take_off
    @flying = true
  end
end
