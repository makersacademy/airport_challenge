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

end
