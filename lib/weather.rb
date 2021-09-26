class Weather
  attr_reader :CONDITIONS

  CONDITIONS = ["Sunny", "Stormy"].freeze

  def get_condition
    CONDITIONS.sample
  end
end
