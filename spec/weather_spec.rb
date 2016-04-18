require 'weather'
describe Weather do
  subject(:weather) { described_class.new }
  it { expect(weather.stormy?).to satisfy { |v| (v==true) || (v==false)} }
end
