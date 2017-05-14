require_relative '../lib/airport'

describe Airport do

  dangerous_wind_speed = 99
  safe_wind_speed = 89

  it 'can clear planes to land' do
    expect(subject).to respond_to(:clear_for_landing).with(1).argument
  end

  it 'can clear planes to take off' do
    expect(subject).to respond_to(:clear_for_takeoff).with(1).argument
  end

  it 'confirms to the user that planes have landed successfully' do
    allow(Kernel).to receive(:rand).and_return(safe_wind_speed)
    plane = double(:plane, land: nil, take_off: nil)
    expect(subject.clear_for_landing(plane)).to eq "Flight #{plane} arrived safely."
  end

  it 'confirms to the user that planes have taken off successfully' do
    allow(Kernel).to receive(:rand).and_return(safe_wind_speed)
    plane = double(:plane, land: nil, take_off: nil)
    subject.planes_currently_landed << plane
    expect(subject.clear_for_takeoff(plane)).to eq "Flight #{plane} departed safely."
  end

  it 'has a default capacity' do
    expect(subject.airport_capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'has a default capacity that can be overridden on initialization' do
    test_capacity = 100
    airport = Airport.new(test_capacity)
    expect(airport.airport_capacity).to eq test_capacity
  end

  it 'does not allow planes to land when the airport is full' do
    allow(Kernel).to receive(:rand).and_return(safe_wind_speed)
    plane = double(:plane, land: nil, take_off: nil)
    Airport::DEFAULT_CAPACITY.times { subject.planes_currently_landed << plane }
    expect { subject.clear_for_landing(plane) }.to raise_error(NoRoomError)
  end

  it 'prevents planes from taking off when the weather conditions are unsafe to do so' do
    plane = double(:plane, land: nil, take_off: nil)
    allow(Kernel).to receive(:rand).and_return(dangerous_wind_speed)
    subject.planes_currently_landed << plane
    expect { subject.clear_for_takeoff(plane) }.to raise_error(BadWeatherError)
  end

  it 'prevents planes from landing when the weather conditions are unsafe to do so' do
    plane = double(:plane, land: nil, take_off: nil)
    allow(Kernel).to receive(:rand).and_return(dangerous_wind_speed)
    expect { subject.clear_for_landing(plane) }.to raise_error(BadWeatherError)
  end

  it 'allows planes to take off when the weather conditions are safe to do so' do
    airport = Airport.new
    plane = double(:plane, land: nil, take_off: nil)
    allow(Kernel).to receive(:rand).and_return(safe_wind_speed)
    airport.planes_currently_landed << plane
    expect(airport.clear_for_takeoff(plane)).to eq "Flight #{plane} departed safely."
  end

  it 'allows planes to land when the weather conditions are safe to do so' do
    plane = double(:plane, land: nil)
    allow(Kernel).to receive(:rand).and_return(safe_wind_speed)
    expect(subject.clear_for_landing(plane)).to eq "Flight #{plane} arrived safely."
  end
end
