class Plane

  attr_accessor :name, :landed

  def initialize
    @name = "#{(0..1).map { ('A'..'Z').to_a[rand(26)] }.join}#{rand(100..400)}"
  end

  def report_landed
    @landed = true
  end

  def report_airborne
    @landed = false
  end

end
