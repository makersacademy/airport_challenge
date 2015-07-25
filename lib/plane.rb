class Plane

  attr_reader :status

  def initialize
    @status = "flying"
  end

  def flying?
    if @status == "flying"
      true
    elsif @status == "landed"
      false
    end
  end

  def land
    @status = "landed"
  end

  def takeoff
    @status = "flying"
  end
end
