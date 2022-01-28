require_relative '../lib/weather.rb'

describe Weather do
  it { is_expected.to respond_to(:is_stormy?) }

end