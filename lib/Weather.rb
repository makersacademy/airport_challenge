class WeatherReporter
  def stormy?
    Kernel.rand(1..6) > 4
  end
end

# module Weather
#
# 	def sunny?
# 		rand(10) > 3
# 	end
#
# 	def stormy?
# 		!sunny?
# 	end
# end
