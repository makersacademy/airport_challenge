require_relative './safety'

class Weather
  include Safety
  attr_reader :status

  def initialize
    @status = 'sunny'
  end

  def update_weather

  end

end
