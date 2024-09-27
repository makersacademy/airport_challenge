module Weather
  def self.stormy?
    #true if lower than percentage chance of stormy weather
    rand(100) < 50 ? true : false
  end
end

