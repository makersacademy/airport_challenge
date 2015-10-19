describe 'Plane features' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  before { allow(airport.weather).to receive(:stormy?).and_return(false) }

  feature 'a new plane' do
    scenario 'is :flying' do
      expect(plane.status).to eq :flying
    end
  end

  feature 'a flying plane' do
    scenario 'has :flying status' do
      airport.clear_for_landing plane
      airport.clear_for_takeoff plane
      expect(plane.status).to eq :flying
    end
    scenario 'a flying plane cannot take off' do
      msg = 'A flying plane cannot take off'
      expect { plane.take_off }.to raise_error(msg)
    end
  end

  feature 'a landed plane' do
    scenario 'has :landed status' do
      airport.clear_for_landing plane
      expect(plane.status).to eq :landed
    end
    scenario 'cannot land' do
      msg = 'A landed plane cannot land'
      airport.clear_for_landing plane
      expect { airport.clear_for_landing plane }.to raise_error(msg)
    end
  end
end
