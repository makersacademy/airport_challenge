class Weather
  attr_reader :stormy

  # def stormy
  #   @stormy
  # end

  def number
    @stormy = rand(4)
  end
end
