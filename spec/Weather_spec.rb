require 'Weather'

describe Weather do
  describe '#stormy?' do
    it "stormy? will return either true or false, depending on the forecast method" do
       expect(subject.stormy?).to be(true).or be(false)
    end

    it "returns true if weather is stormy" do
      allow(subject).to receive(:forecast) { :stormy }
      expect(subject.stormy?).to eq true
    end
  end
end
