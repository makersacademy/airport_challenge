

class Weather

  def initialize
    @weather = rand(20)
  end

  def stormy?
    @weather == 3 ? true : false
  end

end
