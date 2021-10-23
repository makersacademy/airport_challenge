class Weather

  def self.stormy?
    rand < 0.10 ? 'stormy' : 'sunny'
  end

end
  