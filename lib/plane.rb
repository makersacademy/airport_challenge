class Plane


  def initialize
    @flying=true
    @landed=false
  end

  def landed
    @flying=false
    @landed=true
  end

  def flying
    @flying=true
    @landed=false
  end


end
