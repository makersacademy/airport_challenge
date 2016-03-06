class Weather
  def self.stormy?
    rand(1..4) % 4 == 0
  end
end
