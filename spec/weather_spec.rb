require "weather"

describe Weather do

  describe "#initialize" do

    it "can be initiated" do
      expect(subject).to be_an_instance_of(Weather)
    end

  end

  describe "#stormy?" do

    it "expects stormy to return true when storm_chance>0.9" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.stormy?).to eq true
    end

    it "expects stormy to return false when storm_chance<=0.9" do
      allow(subject).to receive(:rand).and_return(0.5)
      expect(subject.stormy?).to eq false
    end

  end

end
