# frozen_string_literal: true

# comment
class Weather
  attr_reader :storms_ahead
  def storms_ahead
    [true, false, false, false].sample
  end
end
