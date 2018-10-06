class Weather

  def self.stormy?
    return true if rand(100) <= 25
    false
  end

end
