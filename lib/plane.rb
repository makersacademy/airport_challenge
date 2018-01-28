class Plane

  attr_reader :airbourne

  def initialize(airbourne = true)
    @airbourne = airbourne
  end

  def landed
    @airbourne = false
  end

  def taken_off
    @airbourne = true
  end

  def airbourne?
    @airbourne
  end

end
