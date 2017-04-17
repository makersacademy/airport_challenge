require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy_weather?) }
end
