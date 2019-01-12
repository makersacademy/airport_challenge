require_relative 'airport'

class Weather
  def stormy
    @weather = false
  end

  def not_stormy
    @weather = true
  end

end
