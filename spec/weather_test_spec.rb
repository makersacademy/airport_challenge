require "weather"

class WeatherTest
  include Weather
end

describe WeatherTest do
  it_behaves_like Weather
end

#shared_examples_for "module Weather" do

#   describe Weather do
#     allow(airport).to receive(:stormy?) { false }
#   end
# end