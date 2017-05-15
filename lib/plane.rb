class Plane

  def initialize
    @taken_off = false
    @landed = false
  end

  def landed?
    @landed
  end

  def taken_off?
    @taken_off
  end

  def update_landed
    @taken_off = false
    @landed = true
  end

  def update_takenoff
    @landed = false
    @taken_off = true
  end

private
  attr_reader :landed, :taken_off

end
