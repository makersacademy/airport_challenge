class Weather

  def self.stormy?
    weather = %w[stormy sunny rainy clear windy].sample
    if weather.include?('stormy')
      return true
    else
      return false
    end
  end
end
