class Weather
  def initialize(stormy = false)
    @stormy = stormy
  end

  def stormy?
    @stormy
  end

  def report_storm
    @stormy = true
  end
end
