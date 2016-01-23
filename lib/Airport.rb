require'./lib/plane.rb'

class Airport

  def initialize
    @planes = []
  end

  def land plane
     @planes << plane
  end

  def planes_landed
    @planes
  end


end