require 'weather'

describe Weather do

  it { is_expected.to respond_to(:is_stormy) }

  describe "#is_stormy?" do

    it "can be stormy weather" do
      today = Weather.new
      allow(subject).to receive(:is_stormy) { true }
      expect(subject.is_stormy).to be true
    end

    it "can be nice weather" do
      today = Weather.new
      allow(subject).to receive(:is_stormy) { false }
      expect(subject.is_stormy).to be false
    end

  end

end
