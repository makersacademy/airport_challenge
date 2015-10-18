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
    expect { plane.take_off }.to raise_error 'A flying plane cannot take off'
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
    airport.clear_for_landing plane
    expect { airport.clear_for_landing plane }.to raise_error 'A landed plane cannot land'
  end
end

feature 'a traffic controller can instruct a plane' do
  let(:plane) { Plane.new }

  scenario 'to land' do
    expect(plane).to respond_to(:land)
  end
  scenario 'to take off' do
    expect(plane).to respond_to(:take_off)
  end
end

feature 'a traffic controller can prevent planes from' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  before do
    allow(airport).to receive(:stormy?).and_return(false)
  end

  scenario 'landing when airport is full' do
    Airport::DEFAULT_CAPACITY.times { airport.clear_for_landing Plane.new }
    expect { airport.clear_for_landing plane }.to raise_error 'Airport is full'
  end

  scenario 'landing when weather is stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.clear_for_landing plane }.to raise_error 'Weather is stormy'
  end

  scenario 'taking off when weather is stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.clear_for_takeoff plane }.to raise_error 'Weather is stormy'
  end

  scenario 'taking off when not registered at airport' do
    expect { airport.clear_for_takeoff plane }.to raise_error 'Plane not registered at this airport'
  end
end

feature 'airport no longer lists plane as registered' do
  scenario 'after take off' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    airport.clear_for_landing plane
    airport.clear_for_takeoff plane
    expect(airport.planes).not_to include plane
  end
end

feature 'airport has a default capacity' do
  scenario 'when initialized' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  scenario 'which a system designer can override when building a new airport' do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end
end
