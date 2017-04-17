class Weather
  attr_reader :stormy

  def number
    @stormy = rand(4)
  end
end
