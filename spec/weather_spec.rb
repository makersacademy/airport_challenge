require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it "is stormy outside" do
    allow(weather).to receive(:forecast) { "Stormy" }
  end

  it "is sunny outside" do
    allow(weather).to receive(:forecast) { "Sunny" }
  end
end
