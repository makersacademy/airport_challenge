require './lib/weather.rb'

describe Weather do
  subject(:weather) { described_class.new }
  it { is_expected.to respond_to :generate_weather }
end
