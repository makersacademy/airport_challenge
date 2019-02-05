# frozen_string_literal: true

# to represent randomised weather
class Weather
  def self.stormy?(weather = rand(4))
    weather.zero?
  end
end
