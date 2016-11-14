require 'airport'
require 'plane'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'allows a plane to land' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      expect{airport.land(plane)}.not_to raise_error
    end

    context 'when airport is full' do
      it 'does not allow planes to land' do
        allow(airport.weather).to receive(:stormy?).and_return(false)
        Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
        expect{airport.land(plane)}.to raise_error(RuntimeError, 'Cannot land plane: airport is full')
      end
    end

    context 'when weather is stormy' do
      it 'does not allow planes to land' do
        allow(airport.weather).to receive(:stormy?).and_return(true)
        expect{airport.land(plane)}.to raise_error(RuntimeError, 'weather is too stormy')
      end
    end
  end

  describe '#take_off' do
    it 'allows planes to take off' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect{airport.take_off(plane)}.not_to raise_error
    end

    context 'when weather is stormy' do
      it 'does not allow planes to take off' do
        allow(airport.weather).to receive(:stormy?).and_return(true)
        expect{airport.take_off(plane)}.to raise_error(RuntimeError, 'weather is too stormy')
      end
    end
  end

  it 'checks that DEFAULT_CAPACITY has been set and is an integer' do
    expect(Airport::DEFAULT_CAPACITY).to be_kind_of(Integer)
  end

  it 'allows the system designer to override default capacity' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end

  it 'allows you to see landed planes, to confirm that they have landed' do
    allow(airport.weather).to receive(:stormy?).and_return(false)
    airport.land(plane)
    expect(airport.planes).to include(plane)
  end

  # it 'changes the flying status of landed planes to false' do
  #   plane = Plane.new
  #   airport.land(plane)
  #   expect(plane.flying).to eq false
  # end

  it 'cannot instruct plane to take off from an airport where it is not present' do
    allow(airport.weather).to receive(:stormy?).and_return(false)
    expect{airport.take_off(plane)}.to raise_error(RuntimeError, 'Plane not available for take off')
  end

  # it 'cannot allow a plane to land at an airport where it is already present' do
  #   airport.land(plane)
  #   expect{airport.land(plane)}.to raise_error(RuntimeError, 'This plane has already landed')
  # end

  # it 'will not land a plane whose status is already "landed"' do
  #   #plane.flying = false
  #   expect{airport.land(plane)}.to raise_error(RuntimeError, 'This plane has already landed')
  # end

  # it 'changes the plane status back to "flying" upon take off' do
  #   airport.land(plane)
  #   airport.take_off(plane)
  #   expect(plane.flying).to eq true
  # end

  it 'has weather conditions' do
    expect(airport.weather).to eq airport.weather
  end

end
