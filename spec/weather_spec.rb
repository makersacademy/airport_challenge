require 'weather'

RSpec.describe Weather do
  context "when stormy" do
    it "logs a message 'stormy'" do
      weather = described_class.new
      allow(weather).to receive(:randomize) { "stormy" }
    end
  end
  context "when sunny" do
    it "logs a message 'sunny'" do
      weather = described_class.new
      allow(weather).to receive(:randomize) { "sunny" }
    end
  end
end
