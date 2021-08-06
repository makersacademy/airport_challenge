class Weather 

  def self.stormy?
    FORECAST.sample == :stormy
  end

  FORECAST = [:sunny, :sunny, :sunny, :sunny]
  # :stormy,
end
