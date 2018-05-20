require "plane"

describe Plane do

  it { is_expected.to respond_to :stormy? }

  describe "#stormy?" do
    context 'when the weather is stormy' do
      it "is stormy?" do
        subject.bad_weather
        expect(subject.stormy?).to eq true
      end
    end
  end

  describe "#weather" do
    it "randomly sets the weather as either sunny or stormy" do
      expect(["sunny", "stormy"]).to include(subject.weather)
    end
  end

end
