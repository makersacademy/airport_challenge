class Plane

  attr_reader :name

  def initialize
    @name = "#{(0..1).map { ('A'..'Z').to_a[rand(26)] }.join}#{rand(100..400)}"
  end

end
