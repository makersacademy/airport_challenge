class Plane

  attr_reader :status

  def initialize
    @status = "flying"
  end

  def flying?
    if @status == "flying"
      true
    else
      false
    end
  end
  def land
    @status = "landed"
  end
end
