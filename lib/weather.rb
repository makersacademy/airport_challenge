class Weather
  def initialize(sunny=true)
    @sunny = sunny
  end
  def sunny?
    @sunny
  end

  def report_storm
    @sunny = false
  end
end
