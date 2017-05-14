class Plane
  attr_reader :landed, :taken_off

  def initialize
    @taken_off = false
    @landed = false
  end

  def update_landed
    reset_takenoff_flag
    @landed = true
  end

  def update_takenoff
    reset_landed_flag
    @taken_off = true
  end

  def landed?
    @landed
  end

  def taken_off?
    @taken_off
  end

  def reset_landed_flag
    @landed = false
  end

  def reset_takenoff_flag
    @taken_off = false
  end

end
