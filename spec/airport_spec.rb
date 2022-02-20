require 'airport'
require 'plane'

describe Airport do

  let(:plane) { Plane.new }
  let(:airport) {Airport.new}

  it { is_expected.to respond_to :capacity }

  it 'allows the system designer to change capacity' do
    airport.capacity = 20
    expect(airport.capacity).to eq(20)
  end

  describe '#land_plane' do

    it { is_expected.to respond_to :planes }
    it 'recognises that a plane has landed' do
      expect(subject.land_plane(plane)).to eq("Successful Landing")
    end

    it 'stores the plane at the airport terminal' do
      airport.land_plane(plane)
      expect(airport.planes).to eq([plane])
    end

    it 'will not allow a plane to land if the weather is stormy' do
      airport.condition = 4
      expect(airport.land_plane(plane)).to eq ('The plane cannot land')
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'checks if there is a plane to take off' do
      expect { airport.take_off }.to raise_error('There are no planes to take off')
    end

    it 'will not allow a plane to take off if the weather is stormy' do
    end

  end

end
