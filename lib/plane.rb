
class Plane

  attr_reader :status

  def initialize
    @status = "flying"
  end

  def flying?
    false if @status == "landed"
    @status == "flying"
  end

  def land
    @status = "landed"
  end

  def takeoff
    @status = "flying"
  end
end
