class Plane
  attr_reader :airborne, :docked
  def initialize
    @airborne = true
    @docked = false
  end

  def final_approach
    @airborne = false
    @docked = true
  end

  def takeoff
    @airborne = true
    @docked = false
  end

  protected

  def docked?
    @docked == true
  end

  def airborne?
    @airborne == true
  end
end
