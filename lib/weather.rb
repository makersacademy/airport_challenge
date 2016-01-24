class Weather

  def stormy?
	  value == 1 ? true : false
  end

  def value
 	rand(1..10)
  end
end