require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  context 'taking off and landing' do

    xit 'a plane can land' do
      airport.land(plane)
    end

    xit 'a plane can take off' do
      airport.fly(plane)
    end
  end

  context 'traffic control' do

    xit 'a plane cannot land if the airport is full' do
      Airport.stub(:stormy).and_return(:'!stormy')
      p = Plane.new
      p.stormy.should eq('landed')
    end
  end

  context 'weather conditions are bad' do
    before do
      allow(airport).to receive(:stormy).and_return true
    end

    xit 'a plane cannot take off when there is a storm brewing' do
      allow(airport).to receive(:stormy).and_return(true)
      expect { airport.takeoff_order(plane) }.to raise_error
    end

    xit 'a plane cannot land in the middle of a storm' do
      allow(airport).to receive(:stormy).and_return(true)
		    expect { airport.landing_order(plane) }.to raise_error
    end
  end
end
