require 'capybara/rspec'

feature 'a plane has a status' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  before do
    allow(airport).to receive(:stormy?).and_return(false)
  end

  scenario 'of :flying when created' do
    expect(plane.status).to eq :flying
  end
  scenario 'when landed' do
    airport.clear_for_landing plane
    expect(plane.status).to eq :landed
  end
  scenario 'when flying' do
    airport.clear_for_landing plane
    airport.clear_for_takeoff plane
    expect(plane.status).to eq :flying
  end
end

feature 'a plane\'s actions are limited: ' do
  let(:plane) { Plane.new }

  scenario 'a flying plane cannot take off' do
    expect { plane.take_off }.to raise_error 'A flying plane cannot take off'
  end

  scenario 'a landed plane cannot land' do
    plane.land
    expect { plane.land}.to raise_error 'A landed plane cannot land'
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
