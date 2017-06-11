require 'weather'

describe Weather do
  it { is_expected.to be_a(Weather) }

  describe "#good?" do
    it { is_expected.to respond_to(:good?)}

    context "good weather" do
      let(:weather) { Weather.new(99) }

      it "returns true when the weather is good" do
        expect(weather.good?).to eq true
      end
    end

    context "bad weather" do
      let(:weather) { Weather.new(10) }

      it "returns false when the weather is bad" do
        expect(weather.good?).to eq false
      end
    end
    
  end
end
