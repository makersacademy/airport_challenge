class WEATHER_REPORT
  attr_reader :report

  def report
    @report = ['stormy', 'clear'].sample
    @report
  end

end
