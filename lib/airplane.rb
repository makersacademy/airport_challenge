require_relative 'airport'

class Airplane
  attr_accessor :flying_status

  def initialize(fly = true)
    @flying_status = fly
  end

  def landed
    @flying_status = false
  end

  def ready_to_take_off
    @flying_status = true
  end

end
