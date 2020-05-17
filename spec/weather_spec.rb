require 'weather'

describe Weather do
  let(:subject) { Weather.new }

  describe "#weather" do
    it { is_expected.to respond_to :weather }

    it "have weather conditions" do
      expect(subject.weather).to eq ["sunny", "sunny", "stormy"]
    end

    it "gives current weather condition" do
      allow(subject).to receive(:rand).and_return("stormy")
    end
  end
end
