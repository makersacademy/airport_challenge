require 'airport'

describe Airport do
  airport = Airport.new(20)

  it 'tells plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'tells plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'prevents plane from landing if airport is full' do
    20.times do 
      airport.land(:plane)
    end
    expect { airport.land(:plane) }.to raise_error "Plane cannot land. Airport is full"
  end
end