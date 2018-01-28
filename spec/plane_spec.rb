require 'plane'

describe Plane do

  let(:airport) { double "an airport" }

  describe "#land" do
    it 'Raises error when airport is full' do
      allow(airport).to receive(:full?) { true }
      allow(airport).to receive(:tell_weather) { "sunny" }
      expect { subject.land(airport) }.to raise_error 'No free spots avaialble at this airport'
    end
    it 'Raises error when plane is already at an airport' do
      allow(subject).to receive(:status) { "at_airport" }
      allow(airport).to receive(:full?) { false }
      allow(airport).to receive(:tell_weather) { "sunny" }
      expect { subject.land(airport) }.to raise_error 'The plane is already at an airport'
    end
    it "lands the plane when sunny" do
      allow(airport).to receive(:full?) { false }
      allow(subject).to receive(:status) { "flying" }
      allow(airport).to receive(:tell_weather) { "sunny" }
      allow(airport).to receive(:planes_a) { [] }
      expect(subject.land(airport)).to eq [subject]
    end
    it "prevent from landing when stormy" do
      allow(airport).to receive(:full?) { false }
      allow(subject).to receive(:status) { "flying" }
      allow(airport).to receive(:tell_weather) { "stormy" }
      allow(airport).to receive(:planes_a) { [] }
      expect(subject.land(airport)).to eq nil
    end
  end

  describe "#take_off" do
    it 'raises error when you want to take off a plane that is already flying' do
      allow(airport).to receive(:full?) { false }
      allow(airport).to receive(:tell_weather) { "sunny" }
      allow(airport).to receive(:planes_a) { [] }
      allow(subject).to receive(:status) { "flying" }
      expect { subject.take_off(airport) }.to raise_error 'The plane is already flying'
    end
    it 'raises error when you want to take off a plane that is not at this airport' do
      allow(airport).to receive(:full?) { false }
      allow(airport).to receive(:tell_weather) { "sunny" }
      allow(airport).to receive(:planes_a) { [] }
      allow(subject).to receive(:status) { "at_airport" }
      expect { subject.take_off(airport) }.to raise_error 'This plane is not at this airport'
    end
    it "Take off the plane when sunny" do
      allow(airport).to receive(:full?) { false }
      allow(subject).to receive(:status) { "at_airport" }
      allow(airport).to receive(:planes_a) { [subject]}
      allow(airport).to receive(:tell_weather) { "sunny" }
      subject.take_off(airport)
      expect(subject.take_off(airport)).to eq subject
    end
    it "Prevent from taking off the plane when stormy" do
      allow(airport).to receive(:full?) { false }
      allow(subject).to receive(:status) { "at_airport" }
      allow(airport).to receive(:planes_a) { [subject] }
      allow(airport).to receive(:tell_weather) { "stormy" }
      expect(subject.take_off(airport)).to eq "The plane cannot take off"
    end
  end

end
