require 'weather'

describe Weather do

  it { is_expected.to respond_to(:is_stormy) }

  describe "#is_stormy?" do

    it "can be stormy weather" do
      today = Weather.new
      allow(today).to receive(:is_stormy) { true }
      expect(today.is_stormy).to be true
    end

    it "can be nice weather" do
      today = Weather.new
      allow(today).to receive(:is_stormy) { false }
      expect(today.is_stormy).to be false
    end
    
  end

end
