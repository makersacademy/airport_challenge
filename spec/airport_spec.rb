require 'airport'
require 'weather'

describe Airport do
  let(:plane) { double :plane }
  let(:airport) { Airport.new }

  context 'taking off and landing' do
    before do
      allow(plane).to receive :land
      allow(plane).to receive :take_off
      allow(airport).to receive(:weather).and_return 'Sunny'
    end

    it 'a plane can land' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'a plane can take off' do
      airport.land(plane)
      airport.take_off plane
      expect(airport.planes).to be_empty
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      Airport.stub(:weather).and_return(:'stormy')
      p = Plane.new
      airport.land(p)
      expect(p.status).to eq :landed
    end
  end

  context 'weather conditions are bad' do
    before do
      allow(airport).to receive(:stormy).and_return true
    end

    it 'a plane cannot take off when there is a storm brewing' do
      Airport.stub(:weather).and_return(true)
      expect { airport.take_off(plane) }.to raise_error 'plane cannot take off'
    end

    it 'a plane cannot land in the middle of a storm' do
      allow(airport).to receive(:stormy).and_return(true)
		  expect { airport.land(plane) }.to raise_error 'plane cannot land'
    end
  end
end
