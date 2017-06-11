class Plane

  attr_accessor :status

  def initialize(status = "landed")
    @status = status
  end

  def landed?
    @status == "landed"
  end

  def took_off
    @status = "took off"
  end

  def confirm_status

  end

end
