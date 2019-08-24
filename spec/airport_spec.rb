require_relative "../lib/airport.rb"
describe Airport do
  describe '#land_plane' do
    it "Airport responded to #land_plane" do
      expect(subject).to respond_to(:land_plane)
    end
    it "land_plane takes an argument" do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end
  end
end

describe Weather do
  describe '#random?' do
    it "Weather class responded to stormy?" do
      expect(subject).to respond_to(:stormy?)
    end
    it "Returns false if #rand is 0.8 (0.8 < 0.1)" do
      expect(subject).to receive(:rand).and_return(0.8)
      expect(subject.stormy?).to eq false
    end
    it "Returns true if #rand is 0.05 (0.8 < 0.1)" do
      expect(subject).to receive(:rand).and_return(0.05)
      expect(subject.stormy?).to eq true
    end
  end
end