require 'airport'
require 'plane'

RSpec.describe Airport do
  
  let(:plane_1) { Plane.new(subject) }
  let(:plane_2) { Plane.new(subject) }

  describe '#land' do
    before do
      plane_1.status = "in flight"
      plane_2.status = "in flight"
    end

    context 'when stormy' do
      before { allow(Weather).to receive(:current).and_return("stormy") }

      it 'prevent landing' do
        expect { subject.land(plane_1) }.to raise_error(described_class::LANDING_ERROR_MESSAGE)
      end
    end

    context 'when not stormy' do
      before { allow(Weather).to receive(:current).and_return("safe") }

      it 'allow landing' do
        expect(subject.land(plane_1)).to eq [plane_1] 
      end

      it 'prevent landing if already landed' do
        subject.land(plane_1)
        expect { subject.land(plane_1) }.to raise_error(described_class::ALREADY_LANDED_ERROR_MESSAGE)
      end
      
      it 'prevent landing if at another airport' do
        subject.land(plane_1)
        airport = Airport.new
        expect { airport.land(plane_1) }.to raise_error(Airport::AIRCRAFT_ELSEWHERE_ERROR_MESSAGE)
      end

      it 'prevent landing if full' do
        subject.land(plane_1)
        expect { subject.land(plane_2) }.to raise_error(described_class::LANDING_ERROR_MESSAGE)
      end

      it 'have plane after landing' do
        subject.land(plane_1)
        expect(subject.planes).to include plane_1
      end

    end
  end

  describe '#takeoff' do
    before do
      plane_1.status = "in flight"
      plane_2.status = "in flight"

      allow(Weather).to receive(:current).and_return("safe")
      subject.land(plane_1)
    end

    context 'when stormy' do
      before do
        allow(Weather).to receive(:current).and_return("stormy")
      end
      
      it 'prevent takeoff' do
        expect { subject.takeoff(plane_1) }.to raise_error(described_class::TAKEOFF_ERROR_MESSAGE)
      end
    end

    context 'when not stormy' do
      it 'allow takeoff' do
        expect { subject.takeoff(plane_1) }.not_to raise_error
      end
      
      it 'does not have plane after takeoff' do
        subject.takeoff(plane_1)
        expect(subject.planes).not_to include plane_1
      end

      context 'when plane not at airport' do
        it 'prevent takeoff' do 
          expect { subject.takeoff(plane_2) }.to raise_error(described_class::AIRCRAFT_NOT_HERE_ERROR_MESSAGE)
        end
      end
    end
  end

  describe '#capacity' do
    it 'default to 1' do
      expect(subject.capacity).to be 1
    end
    it 'allow change' do
      subject.capacity = 10
      expect(subject.capacity).to be 10
    end
  end
end
