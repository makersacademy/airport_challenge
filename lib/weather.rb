class Weather

  attr_reader :stormy

  def stormy?
    return @stormy = false unless rand(8) == 1
    @stormy = true
  end

end
