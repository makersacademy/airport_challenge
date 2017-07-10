require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it "can be stormy" do
    allow(weather).to receive(:rand) { 78 }
    expect(weather.stormy).to be true
  end
end
