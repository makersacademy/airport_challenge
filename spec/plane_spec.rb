require 'plane'

describe Plane do

  let(:airport) { double "an airport"}

  describe "#land" do
    it 'raises error when full' do
      allow(airport).to receive(:full?) { true }
      allow(subject).to receive(:tell_weather) { "sunny" }
      expect { subject.land(airport) }.to raise_error 'No free spots avaialble'
    end
    it "lands the planes when sunny" do
      allow(airport).to receive(:full?) { false }
      allow(subject).to receive(:tell_weather) { "sunny" }
      allow(airport).to receive(:planes_a) { [] }
      expect(subject.land(airport)).to eq [subject]
    end
    it "prevent from landing when stormy" do
      allow(airport).to receive(:full?) { false }
      allow(subject).to receive(:tell_weather) { "stormy" }
      allow(airport).to receive(:planes_a) { [] }
      expect(subject.land(airport)).to eq nil
    end
  end

  describe "#take_off" do
    it "take off the plane when sunny" do
      allow(airport).to receive(:full?) { false }
      allow(airport).to receive(:planes_a) { [subject]}
      allow(subject).to receive(:tell_weather) { "sunny" }
      subject.take_off(airport)
      expect(subject.take_off(airport)).to eq subject
    end
    it "prevent from taking off the plane when stormy" do
      allow(airport).to receive(:full?) { false }
      allow(airport).to receive(:planes_a) { [] }
      allow(airport).to receive(:tell_weather) { "sunny" }
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.take_off(airport)).to eq "the plane cannot take off"
    end
  end

  describe "#random" do
    it "returns a number from 0 to 6" do
      expect(subject).to receive(:random).and_return(1)
      expect(subject.random).to eq 1
    end
  end

  describe "#tell_weather" do
    it "says it's stormy" do
      allow(subject).to receive(:random) { 1 }
      expect(subject.tell_weather).to eq "stormy"
    end
    it "says it's sunny" do
      allow(subject).to receive(:random) { 2 }
      expect(subject.tell_weather).to eq "sunny"
    end
  end

end
