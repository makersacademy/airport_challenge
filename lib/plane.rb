class Plane
  attr_reader :landed

  def land
    puts "Plane landed"
    @landed = true
  end

  def depart
    puts "Plane departed"
    @landed = false
  end

end
