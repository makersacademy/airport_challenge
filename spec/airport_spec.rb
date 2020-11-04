require 'airport'

describe Airport do

  let (:plane) { Plane.new }

  context '#landing method' do
    it 'is able to land a plane' do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it 'pushes the planes in to hangar' do
      subject.landing(plane)
      expect(subject.hangar).to eq [plane]
    end

    it 'wont allow more planes than the capacity allows for' do
      airport = Airport.new([], 0)
      allow(airport).to receive(:rand) { 20 }
      expect { airport.landing(plane) }.to raise_error "NO SPACE"
    end

    it 'wont allow planes to land if the weather is bad' do
      allow(subject).to receive(:rand) { 1 }
      expect { subject.landing(plane) }.to raise_error "HOLY SH*T ITS WET"
    end
  end

  context '#take_off method' do
    it 'is able to let a plane take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'removes the plane from the hangar when it takes off' do
      airport = Airport.new([plane])
      allow(airport).to receive(:rand) { 20 }
      expect(airport.take_off(plane)).to eq(plane)
      expect(airport.hangar).to be_empty
    end

    it 'wont allow planes to take of if the weather is bad' do
      airport = Airport.new([plane])
      allow(airport).to receive(:rand) { 1 }
      expect { airport.take_off(plane) }.to raise_error "HOLY SH*T ITS WET"
    end
  end
end
