require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  before(:each) do
    @fk_airport = double(:ping => 'I am an airport.')
  end

  describe '#land' do

    it 'lands at an airport unless flying' do
      plane.land(@fk_airport)
      expect { plane.land(@fk_airport) }.to raise_error('Plane is on ground!')
    end

  end

  describe '#takeoff' do

    it 'takes off from an aiport unless flying' do
      plane.land(@fk_airport)
      plane.takeoff
      expect { plane.takeoff }.to raise_error('Plane is already flying!')
    end

  end

  describe '#ping' do
    it 'responds to a transponder ping' do
      expect(plane.ping).to eq 'I am a plane.'
    end
  end

end
