require 'airport'
require 'planes'

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
    context 'when not stormy' do
      before do
        airport = Airport.new
        allow(airport).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to land' do
        airport = Airport.new
        expect(airport).to respond_to(:land).with(1).argument
      end
    end
    context 'when stormy' do
      before do
        airport = Airport.new
        allow(airport).to receive(:stormy?).and_return true
      end
      it "Plane cannot land when stormy" do
        airport = Airport.new
        expect { airport.land(plane) }.to raise_error { "Too stormy to land" }
      end
    end
    context 'when the airport is full' do
      before do
        airport = Airport.new
        allow(airport).to receive(:stormy?).and_return false
      end
      it "cannot land plane as airport is full" do
        airport = Airport.new
        expect { airport.land(plane) }.to raise_error { "Airport is full" }
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        airport = Airport.new
        allow(airport).to receive(:stormy).and_return false
      end
      it 'instructs the plane to take off' do
        airport = Airport.new
        expect(airport).to respond_to(:take_off)
      end
    end
    context 'when stormy' do
      before do
        airport = Airport.new
        allow(airport).to receive(:stormy).and_return false
      end
      it "Plane cannot take off when stormy" do
        airport = Airport.new
        expect { airport.take_off }.to raise_error { "Too stormy to take off" }
      end
    end
  end

end
