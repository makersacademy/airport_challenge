class Weather
  attr_reader :conditions

  CONDITIONS = ["Sunny", "Stormy"].freeze

  def get_condition
    return CONDITIONS.sample
  end
end
