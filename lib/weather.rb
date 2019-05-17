class Weather
# attr_reader :weather_today
# attr_reader :report
#
#   def initialize
#     @weather_today
#   end

#   def weather_generator
#     @outlook = rand(10)
#   end
# #
  def report
    outlook = rand(10)
    outlook == 1? "stormy" : "sunny"

  end



# private
#   def stormy?
#     @outlook == 1
#   end


end
