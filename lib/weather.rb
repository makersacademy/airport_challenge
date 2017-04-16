require_relative './safety'

class Weather
  include Safety
  attr_reader :status

  def initialize
    forecast = rand(1..100)
    if forecast >= 90
      @status = 'stormy'
    else
      @status = 'sunny'
    end
  end
end
