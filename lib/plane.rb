class Plane

  attr_accessor :name, :grounded

  def initialize
    @name = "#{(0..1).map { ('A'..'Z').to_a[rand(26)] }.join}#{rand(100..400)}"
  end

  def report_grounded
    @grounded = true
  end

  def report_airborne
    @grounded = false
  end

end
