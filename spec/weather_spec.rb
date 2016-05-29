require 'weather'

describe Weather do

  describe "#is_stormy?" do

    it "can be sunny" do
      allow(subject).to receive(:is_stormy?) {false}
      expect(subject.is_stormy?).to eq false
    end

    it "can be stormy" do
      allow(subject).to receive(:is_stormy?) {true}
      expect(subject.is_stormy?).to eq true
    end
  end

  describe "#summer" do

    it "can be set to summer" do
      expect(subject.summer).to eq [false,false,false,false,true]
    end
  end

  describe "#winter" do

    it "can be set to winter" do
      expect(subject.winter).to eq [true,true,true,true,false]
    end
  end
end
