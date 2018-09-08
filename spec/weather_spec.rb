require 'weather'

describe Weather do

  describe '#rng' do
    it "should have a method called rng" do
      expect { subject.rng }.not_to raise_error
    end

    it "returns a random number between 0 and 100" do
      allow(subject).to receive(:rng) { 59 }
    end

    it "returns string sunny if number is between 50 and 100" do
      weather = Weather.new
      
      expect(weather.rng).to eq "Fly away, baby"
    end
  end
end
