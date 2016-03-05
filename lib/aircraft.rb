class Aircraft
attr_reader :landed

  def initialize
    @landed = true
  end

  def change_status
    @landed = !@landed
  end

end
