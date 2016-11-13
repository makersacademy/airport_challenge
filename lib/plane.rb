require_relative 'weather'

class Plane
attr_reader :landed

  def initialize(landed = false)
    @landed = landed
  end

  def land
    already_landed?
    @landed = true
  end

  def take_off
    already_taken_off?
    @landed = false
  end

  private

  def already_landed?
    fail "Plane is already on the ground." if @landed
  end

  def already_taken_off?
    fail "Plane is already in the air." if @landed == false
  end
end
