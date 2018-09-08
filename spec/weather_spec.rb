require 'weather'

describe Weather do

  describe '#rng' do
    it "should have a method called rng" do
      expect { subject.rng }.not_to raise_error
    end

    it "returns a random number between 0 and 100" do
      allow(subject).to receive(:rng) { 59 }
    end

    it "returns method sunny if number is between 50 and 100" do
      allow(subject).to receive(:rng) { sunny }
    end
    
    it "returns method stormy if number is between 51 and 100" do
      allow(subject).to receive(:rng) { stormy }
    end
  end

  describe "#sunny" do
    it "should output 'fly away baby'" do
      expect(subject.sunny).to eq "Fly away, baby"
    end
  end

  describe "#stormy" do
    it "should output 'stay put'" do
      expect(subject.stormy).to eq "Stormy"
    end
  end
end
