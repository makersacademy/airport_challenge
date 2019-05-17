class Weather
# attr_reader :weather_today
# attr_reader :report
#
#   def initialize
#     @weather_today
#   end

  def weather_generator
    @outlook = rand(10)
  end

  def report
    if stormy?
      "stormy"
    else
      "sunny"
    end
  end

private
  def stormy?
    @outlook == 1
  end


end
