# I have created this as a module rather than a class 
# as it could then be used in more than one class
# and also classes seem to be for objects whilst
# modules are for functionality. It also means I can 
# use the extend directive to allow its methods to
# be available for the Airport class methods

module Weather

  STORMY_WEATHER = 52

  def set_weather
    rand(100)
  end

  def stormy?
    return true if set_weather == STORMY_WEATHER
    return false
  end

end
