require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it "can be stormy" do
    allow(Kernel).to receive(:rand) { 99 }
    expect(weather.stormy?).to be true
  end

  it "can be stormy" do
    allow(Kernel).to receive(:rand) { 70 }
    expect(weather.stormy?).to be false
  end
end
