require 'weather'

describe Weather do
  it { should respond_to(:stormy) }
  it { should respond_to(:random_weather) }
end
