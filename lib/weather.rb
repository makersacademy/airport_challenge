class Weather
  def self.stormy?
    x = rand(11)
    return true if x == 10

    false
  end
end
