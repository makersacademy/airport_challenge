class Aircraft
attr_reader :landed

  def initialize
    @landed = true
  end

  # flips status between landed <-> airbourne
  # following landing and takeoff
  def change_status
    @landed = !@landed
    self
  end

end
