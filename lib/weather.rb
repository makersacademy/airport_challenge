class Weather

  attr_reader :stormy



  def stormy?
    # choose = rand(5)
    # WEATHER[choose] == :stormy
    false
  end

  private

  WEATHER = [:stormy, :sunny, :sunny, :sunny, :sunny]

end
