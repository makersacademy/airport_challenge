require 'weather'

describe Weather do
  describe '#weather check' do
    it "checks for storm" do
      allow(subject).to receive(:random_weather).and_return("stormy")
      expect(subject.check_for_storm).to eq true
    end
  end
end
