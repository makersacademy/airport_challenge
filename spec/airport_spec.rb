require './lib/airport'
require './lib/weather'

describe Airport do
  subject { Airport.new }

  describe "#land" do
    it 'can land a plane' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) {false}
      expect(subject.land(plane)).to eq [plane]
    end

    describe "#takeoff" do
      it 'can takeoff from airport' do
        plane = Plane.new
        subject.land(plane)
        allow(subject).to receive(:stormy?) {false}
        expect(subject.takeoff).to eq plane
      end

      it "does not let planes land when stormy" do
        weather = Weather.new
        allow(subject).to receive(:stormy?) {true}
        expect { subject.takeoff }.to raise_error 'It is stormy, you cannot take off'
      end
    
      describe "#land" do
        it 'does not allow planes to land when airport is full' do
          plane = Plane.new
          allow(subject).to receive(:stormy?) {false}
          Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
          expect { subject.land(plane) }.to raise_error 'The Airport is full, you cannot land'
        end

        it 'does not allow planes to land when stormy' do
          plane = Plane.new
          allow(subject).to receive(:stormy?) {true}
          expect { subject.land(plane) }.to raise_error 'It is stormy, you cannot land'
        end

        it 'allows system designer to set capacity' do
          expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
        end
      end
    end
  end
end
