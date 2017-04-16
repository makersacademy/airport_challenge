require './lib/weather'

describe Weather do
  it { is_expected.to respond_to(:random_condition) }
  it { is_expected.to respond_to(:stormy?) }
end
