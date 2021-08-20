require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  context 'Normal weather' do
    before do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return false
    end

    describe '#land' do
      it 'instructs a plane to land at an airport' do
        expect(subject.land(plane)).to eq [plane]
      end

      it 'allows a plane to land' do
        expect { subject.land(plane) }.not_to raise_error
      end
  
      it 'raises an error to prevent landing when the airport is full' do
        Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        error = "Landing is not permmited- the airport is full"
        expect { subject.land(plane) }.to raise_error error
      end
    end
  
    describe '#take_off' do
      it 'instructs the plane to take off' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include plane
      end

      it 'raises an error if the plane is at another airport' do
        airport_2 = Airport.new
        airport_2.land(plane)
        error = "Cannot take off- the plane is at another airport"
        expect { subject.take_off(plane) }.to raise_error error
      end
      
    end
  end

  context 'Stormy weather' do
    before do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return true
    end

    it 'prevents landing' do
      error = "Landing is not permmited- stormy weather!"
      expect { subject.land(plane) }.to raise_error error
    end

    it 'prevents takeoff' do
      error = "Take off is not permmited- stormy weather!"
      expect { subject.take_off(plane) }.to raise_error error
    end
  end
end
