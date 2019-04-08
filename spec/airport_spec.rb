require 'airport'
require 'planes'
require 'weather'

describe Airport do

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it ' the user can set the capacity' do
      subject { Airport.new(20) }
      expect(subject.capacity).to eq(20)
    end

    it "assumes the airport starts empty" do
      airport = Airport.new
      expect(airport.planes).to eq([])
    end
  end

  describe '#land' do
    plane = Planes.new
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to land' do
        expect(subject).to respond_to(:land).with(1).argument
      end
    end
    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return true
      end
      it "Plane cannot land" do
        expect { subject.land(plane) }.to raise_error 'Too stormy to land'
      end
    end
    context 'when the airport is full' do
      it "cannot land plane" do
        allow(subject).to receive(:stormy?).and_return false
        Airport::DEFAULT_CAPACITY.times do
          subject.land(double(plane))
        end
        expect { subject.land(plane) }.to raise_error 'Airport full'
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy).and_return false
      end
      it 'instructs the plane to take off' do
        expect(subject).to respond_to(:take_off)
      end
    end
    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return true
      end
      it "Plane cannot land" do
        expect { subject.take_off }.to raise_error 'Too stormy to take off'
      end
    end
  end

end
