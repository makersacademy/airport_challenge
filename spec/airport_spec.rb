require 'airport'
require 'weather'

describe Airport do
  let(:plane) {double :plane }
  let(:airport) { Airport.new }

  context 'taking off and landing' do
    before do
      allow(plane).to receive :land
      allow(plane).to receive :fly
      allow(airport).to receive(:weather).and_return "Sunny"
    end

    it 'a plane can land' do
      airport.landing_order(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'a plane can take off' do
      airport.fly(plane)
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      Airport.stub(:stormy).and_return(:'sunny')
      p = Plane.new
      p.stormy.should eq('landed')
    end
  end

  context 'weather conditions are bad' do
    before do
      allow(airport).to receive(:stormy).and_return true
    end

    it 'a plane cannot take off when there is a storm brewing' do
      allow(airport).to receive(:stormy).and_return(true)
      expect { airport.takeoff_order(plane) }.to raise_error
    end

    it 'a plane cannot land in the middle of a storm' do
      allow(airport).to receive(:stormy).and_return(true)
		    expect { airport.landing_order(plane) }.to raise_error
    end
  end
end
