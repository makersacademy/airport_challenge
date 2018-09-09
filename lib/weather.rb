class Weather
  def forecast
    # return :sunny or :stormy roughly in the ratio 5:1
    return :sunny unless rand(5).zero?
    return :stormy
  end
end
