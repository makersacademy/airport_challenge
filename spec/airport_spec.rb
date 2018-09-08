require 'airport'
# require 'plane'

describe Airport do

  plane = Plane.new

  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it 'responds to take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'has landed planes?' do
    expect(subject.planes?)
  end

  it 'lands planes' do
    expect(subject.land(plane)).to eq("plane has landed")
  end

  it 'doesnt allow landing when stormy' do
    airport = Airport.new
    # stormy = double("stormy")
    allow(airport).to receive(:stormy).and_return(true)
    expect { airport.land(plane) }.to raise_error("weather is too bad for landing")
  end

  it 'doesnt allow take off when stormy' do
    airport = Airport.new
    # stormy = double("stormy")
    allow(airport).to receive(:stormy).and_return(true)
    expect { airport.take_off(plane) }.to raise_error("weather is too bad for take-off")
  end

  it 'returns stormy weather "true"' do
    airport = Airport.new
    stormy = double("stormy")
    allow(airport).to receive(:stormy).and_return(true)
  end

end
