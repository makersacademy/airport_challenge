require "weather"

describe Weather do

  describe "initialize" do

    it "can be initiated" do
      expect(subject).to be_an_instance_of(Weather)
    end

    it "when initiated stores a weather variable with a float" do
      expect(subject.storm_chance).to be_kind_of(Float)
    end

  end

  describe "stormy?" do

    it "expects stormy to return true when storm_chance>0.9" do
      subject.instance_variable_set(:@storm_chance, 1)
      expect(subject.stormy?).to eq true
    end

    it "expects stormy to return false when storm_chance<=0.9" do
      subject.instance_variable_set(:@storm_chance, 0.5)
      expect(subject.stormy?).to eq false
    end

  end

end
