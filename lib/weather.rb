class Weather
  def self.stormy?
    return true if rand * 100 < 10
    false
  end
end
