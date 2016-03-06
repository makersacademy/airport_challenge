class Weather

  def inclement?
    random_weather == :inclement
  end

  private

  STATUS = [:inclement, :clear, :clear, :inclement, :inclement, :clear]

  def random_weather
    STATUS.sample
  end
end
