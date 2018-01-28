# frozen_string_literal: true

# comment
class Weather
  attr_reader :stormy
  def stormy
    [true, false, false, false].sample
  end
end
