class Weather
  attr_reader :number_generator

  def initialize
    @number_generator = Random.new
  end

  def weather_report
    if @number_generator.rand(2) == 1
      :stormy
    else
      :sunny
    end
  end
end
