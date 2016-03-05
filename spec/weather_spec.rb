require 'weather'
describe Weather do
  subject(:weather) { described_class.new }
  it { expect(weather.stormy?).not_to be_nil }
end
