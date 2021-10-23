require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }  

  describe '#land' do
    it { is_expected. to respond_to :land }

    it 'lands a plane' do
      p = airport.land("plane1")
      expect(airport.planes).to include("plane1")
    end

    it 'raises an error when the airport is full' do
      20.times { airport.land(plane)}
      expect { airport.land(plane) }.to raise_error("The airport is full!")
    end
  end

  describe '#take_off' do
    it { is_expected. to respond_to :take_off }

    it 'takes off a plane and confirms that it is no longer in the airport' do
      expect(airport.take_off).to eq("This plane is no longer in the airport!")
    end
  end
end