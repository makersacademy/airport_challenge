class Aircraft
attr_reader :landed

  def initialize
    @landed = false
  end

  def change_status
    @landed = !@landed
    self
  end
end
