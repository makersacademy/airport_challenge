require 'plane'

describe Plane do
  let(:airport) { double(:airport, capacity: 20, landed_planes: [], weather: "sunny") }

  describe "#land" do
    it 'should be able to land in an airport' do
      subject.land(airport)
      expect(airport.landed_planes). to eq [subject]
    end

    it 'should not land if the weather is stormy' do
      allow(airport).to receive(:weather).and_return "stormy"
      expect { subject.land(airport) }.to raise_error "Stormy weather, cannot land."
    end

    it 'cannot land if it is already in the airport' do
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "Plane already in the airport."
    end

    it 'cannot land if the airport is full' do
      20.times { airport.landed_planes << subject }
      expect { subject.land(airport) }.to raise_error "Airport is full!"
    end
  end

  describe "#take_off" do
    it 'should be able to take off from an airport' do
      airport.landed_planes << subject
      subject.take_off(airport)
      expect(airport.landed_planes).to eq []
    end

    it 'cannot take off if not already in the airport' do
      expect { subject.take_off(airport) }.to raise_error "Plane not in the airport."
    end

    it 'cannot take off if the weather is stormy' do
      subject.land(airport)
      allow(airport).to receive(:weather).and_return "stormy"
      expect { subject.take_off(airport) }.to raise_error "Stormy weather, cannot take off."
    end
  end

  describe "#location" do
    it 'should have a default location of the sky' do
      expect(subject.location).to eq "sky"
    end

    it 'changes its location to airport once landed' do
      subject.land(airport)
      expect(subject.location).to eq "airport"
    end

    it 'should be in the sky after taking off again' do
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.location).to eq "sky"
    end
  end
end
