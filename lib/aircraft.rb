class Aircraft
attr_reader :landed

  # creates an aircraft with a default status: landed
  def initialize
    @landed = true
  end

  # flips status between following landing and takeoff
  def change_status
    @landed = !@landed
    self
  end
end
