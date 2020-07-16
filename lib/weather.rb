# frozen_string_literal: true

# class Weather
class Weather
  def stormy?
    Kernel.rand(1..10) > 8
  end
end
