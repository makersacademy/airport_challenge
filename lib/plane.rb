class Plane

  attr_reader :status

  def initialize
    @status = "flying"
  end

  def take_off
    @status
  end

  def land
    @status = "landed"
  end

  def maintenance
  	@status = "in maintenance"
  end

end
