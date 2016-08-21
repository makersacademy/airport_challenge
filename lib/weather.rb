class Weather

  def initialize
    @outlook = [:stormy, :good, :good, :good]
  end
  private

  def weather
    @outlook.sample
  end
end
