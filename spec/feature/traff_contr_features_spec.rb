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

  before do
    allow(airport).to receive(:stormy?).and_return(false)
  end

  scenario 'landing when airport is full' do
    msg = 'Airport is full'
    Airport::DEFAULT_CAPACITY.times { airport.clear_for_landing Plane.new }
    expect { airport.clear_for_landing plane }.to raise_error(msg)
  end

  scenario 'landing when weather is stormy' do
    msg = 'Weather is stormy'
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.clear_for_landing plane }.to raise_error(msg)
  end

  scenario 'taking off when weather is stormy' do
    msg = 'Weather is stormy'
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.clear_for_takeoff plane }.to raise_error(msg)
  end

  scenario 'taking off when not registered at airport' do
    msg = 'Plane not registered at this airport'
    expect { airport.clear_for_takeoff plane }.to raise_error(msg)
  end
end
