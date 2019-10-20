require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it "it is stormy" do
    allow(weather).to receive(:randomise) { 95 }
    expect(weather.forecast).to eq "Stormy"
  end

  it "is sunny outside" do
    allow(weather).to receive(:randomise) { 20 }
    expect(weather.forecast).to eq "Sunny"
  end
end
