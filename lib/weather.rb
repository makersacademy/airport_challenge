class Weather

  attr_accessor :stormy

  def set
    @stormy = rand(0..9) == 9
  end

end