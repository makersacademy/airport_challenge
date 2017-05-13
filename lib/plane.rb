class Plane
  attr_reader :landed, :taken_off

  def initialize
    @taken_off = false
    @landed = false
  end

  def update_landed
    @landed = true
    @taken_off = false
  end

  def update_takenoff
    @taken_off = true
    @landed = false
  end

  def landed?
    @landed
  end

  def taken_off?
    @taken_off
  end


end
