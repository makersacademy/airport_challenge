require 'capybara/rspec'

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

  scenario 'landing when airport is full' do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.clear_for_landing plane
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
