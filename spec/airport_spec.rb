require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane, land: nil }
  let(:plane1) { double :plane, land: nil, take_off: nil, landed?: true }
  let(:weather) { double :weather }

  context 'when not stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end

    it 'should check the airport has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should check the airport can have a variable capacity' do
      airport = Airport.new(50)
      50.times { airport.tell_plane_to_land(Plane.new) }
      expect{ airport.tell_plane_to_land(Plane.new) }.to raise_error 'Airport full'
    end
  end


  describe '#tell_plane_to_land' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'should land a plane' do
        airport.tell_plane_to_land(plane)
        expect(airport.planes.include?(plane)).to eq true
      end

      it 'should raise an error if the airport is full' do
        Airport::DEFAULT_CAPACITY.times { airport.tell_plane_to_land(Plane.new) }
        expect { airport.tell_plane_to_land(Plane.new) }.to raise_error 'Airport full'
      end

    end

    context 'when stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it 'should raise an error if a plane tries to land when it\'s stormy' do
        expect{airport.tell_plane_to_land(plane)}.to raise_error "Plane can't land in a storm"
      end
    end
  end

  describe '#tell_plane_to_take_off' do

    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'should let a plane take off' do
        airport.tell_plane_to_land(plane1)
        airport.tell_plane_to_take_off(plane1)
        expect(airport.planes.include?(plane1)).to eq false
      end

    end

    context 'when stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it 'should raise an error if a plane tries to take off when it\'s stormy' do
        airport.tell_plane_to_land(plane1)
        expect{airport.tell_plane_to_take_off(plane1)}.to raise_error "Plane can't take off in a storm"
      end

    end

  end

end
