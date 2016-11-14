class Weather

  #attr_reader :current_weather

  # def initialize
  #   @current_weather = 'not stormy'
  # end

  def stormy?
    rand(1..5) == 1
  end

end
