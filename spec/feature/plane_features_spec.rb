require 'capybara/rspec'

feature 'a new plane' do
  let(:plane) { Plane.new }

  scenario 'is :flying' do
    expect(plane.status).to eq :flying
  end
  scenario 'is not in an airport' do
    expect(plane.location).to eq :air
  end
end

feature 'a flying plane' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  before do
    allow(airport).to receive(:stormy?).and_return(false)
  end

  scenario 'has :flying status' do
    airport.clear_for_landing plane
    airport.clear_for_takeoff plane
    expect(plane.status).to eq :flying
  end
  scenario 'is not in an airport' do
    expect(plane.location).to eq :air
  end
  scenario 'a flying plane cannot take off' do
    msg = 'A flying plane cannot take off'
    expect { plane.take_off }.to raise_error(msg)
  end
end

feature 'a landed plane' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  before do
    allow(airport).to receive(:stormy?).and_return(false)
  end

  scenario 'has :landed status' do
    airport.clear_for_landing plane
    expect(plane.status).to eq :landed
  end
  scenario 'has :location in an airport' do
    airport.clear_for_landing plane
    expect(plane.location).to eq airport
  end
  scenario 'cannot land' do
    msg = 'A landed plane cannot land'
    airport.clear_for_landing plane
    expect { airport.clear_for_landing plane }.to raise_error(msg)
  end
end
