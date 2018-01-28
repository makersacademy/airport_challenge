# frozen_string_literal: true

# comment
class Weather
  attr_accessor :stormy
  def stormy
    [true, false, false, false].sample
  end
end
