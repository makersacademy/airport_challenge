require 'airport'

describe Airport do

  it 'instructs planes to land at airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'instructs planes to take off at airport' do
    expect(subject).to respond_to(:takeoff).with(1).argument
    
  end
  
  it 'instructs planes not to land when airport is full' do
    airport = Airport.new  
    plane = Plane.new
    airport.capacity(4)
    5.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error("Airport is full, plane cannot land")
  end
  
  
end
