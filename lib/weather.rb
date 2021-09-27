class Weather
  attr_reader :conditions

  CONDITIONS = ["Sunny", "Stormy"].freeze

  def condition
    return CONDITIONS.sample
  end
end
