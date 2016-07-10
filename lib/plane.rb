require_relative 'airport'
require_relative 'weather'

class Plane

  def initialize
    @airborn = true
  end

  def airborn?
    @airborn
  end

  def touch_down
    @airborn = false
  end

  def up_up_and_away
    @airborn = true
  end

  def status
    @airborn == true ? "currently in the air" : "currently landed at an airport"
  end
end
