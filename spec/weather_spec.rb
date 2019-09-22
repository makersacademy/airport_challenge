require "weather"

describe Weather do

  describe '#stormy' do
    it "if it is stormy, it is stormy" do
      allow_any_instance_of(Weather).to receive(:rand).and_return(2)
      expect(subject.stormy?).to eq true
    end
  end

  describe '#stromy' do
    it "if it isnt stormy, it isnt stormy" do
      allow_any_instance_of(Weather).to receive(:rand).and_return(1)
      expect(subject.stormy?).to eq false
    end
  end

end
