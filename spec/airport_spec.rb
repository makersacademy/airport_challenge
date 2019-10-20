# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

require 'airport'


describe Airport do

let(:airport) { Airport.new }
let (:plane) { Plane.new }

describe '#land(plane)' do

  it 'allows planes to land at airport' do
    allow(subject).to receive(:stormy?).and_return false
    allow(subject).to receive(:has_landed?).and_return false
    allow(subject).to receive(:in_airport).and_return false
    subject.land(plane)
    allow(subject).to receive(:has_landed?).and_return true
    expect(subject.planes).to include plane
    end


    it 'does not allow planes to land if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error "It is too stormy to land"
  end


  it 'does not allow planes to land if airport is full' do
    allow(subject).to receive(:stormy?). and_return false
    allow(subject).to receive(:has_landed?).and_return false
    expect { subject.land(plane) }.to raise_error "Airport is full"
end

it 'does not allow planes that have already landed to land' do
  allow(subject).to receive(:stormy?).and_return false
  allow(subject).to receive(:has_landed?).and_return true
  expect { subject.land(plane) }.raise_error "This plane has already landed"
  end
end

  describe '#take_off(plane)' do
    it 'allows planes to take off from airport' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:has_landed?).and_return false
      allow(subject).to receive(:in_airpot?).and_return true
      subject.take_off(plane)
      expect(plane).to eq(plane)
      end

      it 'does not allow planes to take off if weather is stormy' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off(plane) }.to raise_error "it is too stormy for take off"
      end

      it 'does not allow a plane to take off if the plane is currently not in the airport' do
      allow(subject).to receive(:stormy?).and_return false
      allow(subject).to receive(:has_landed).and_return false
      expect { subject.take_off(plane) }.to raise_error "Plane is not here"
      end
    end
  end
