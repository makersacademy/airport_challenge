class Aircraft
attr_reader :landed

  # creates an aircraft with a default status: airbourne
  def initialize
    @landed = false
  end

  # flips status between following landing and takeoff
  def change_status
    @landed = !@landed
    self
  end
end
