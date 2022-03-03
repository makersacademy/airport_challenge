require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe '#land' do
    it 'adds a plane to the hangar' do
      allow(airport).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?).and_return(false)
      expect { airport.land(plane) }.to change { airport.hangar.count }.by(1)
    end

    it 'prevents landing when airport is full' do
      allow(airport).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Hangar full'
    end

    it 'stops a plane landing when it is already at the airport' do
      allow(plane).to receive(:landed?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Plane already in airport'
    end
  end

  describe '#take_off' do
    it 'confirms when a plane has left the airport' do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane)).to eq Airport::TAKE_OFF_MESSAGE
    end

    # it 'reduces number of planes in hangar by 1' do
    #   allow(airport).to receive(:stormy?).and_return(false)
    #   allow(plane).to receive(:landed?).and_return(false)
    #   airport.land(plane)
    #   expect { airport.take_off(plane) }.to change { airport.hangar.count }.by(-1)
    # end

    it 'stops a plane taking off if it is already airborne' do
      allow(plane).to receive(:landed?).and_return(false)
      expect { airport.take_off(plane) }.to raise_error 'Plane already took off'
    end

    # it 'lets a plane take off from the airport it is already in' do
    #   allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
    #   allow(plane).to receive(:landed?).and_return(false)
    #   heathrow = Airport.new
    #   gatwick = Airport.new
    #   heathrow.land(plane)
    #   expect { heathrow.take_off(plane) }.to_not raise_error
    #   expect { gatwick.take_off(plane) }.to raise_error 'Plane not in this airport'
    # end
  end

  context 'stormy weather' do
    it 'prevents a plane landing in stormy weather' do
      allow(airport).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:landed?).and_return(false)
      expect { airport.land(plane) }.to raise_error Airport::STORMY_LAND_MESSAGE
    end

    it 'prevents a plane taking off in stormy weather' do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error Airport::STORMY_TAKE_OFF_MESSAGE
    end
  end
end