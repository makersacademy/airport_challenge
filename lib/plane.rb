class Plane

  attr_accessor :status

  def initialize(status = "available")
    @status = status
  end

  def status_arrived
    self.status = "arrived"
  end

  def status_departed
    self.status = "departed"
  end

end
