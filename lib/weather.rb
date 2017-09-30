class Weather

  attr_accessor :stormy

  def randomize
    @stormy = rand(0..9) == 9
  end

end