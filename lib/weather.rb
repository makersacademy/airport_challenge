class Weather

  attr_reader :stormy	

  def stormy?
  	# if return value is less than or equal to 10, weather is stormy
    rand(100) <= 10
  end
end
