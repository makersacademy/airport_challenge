require 'airport'

describe Airport do
  let(:plane) { Airport.new }

  it " allows planes to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end 
  it "takes off from an airport" do
    subject.take_off
    expect(subject.take_off).to eq "Plane has taken off"
  end

  it " does not allow landing when full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(Airport.new) }
    expect { subject.land(plane) }.to raise_error "Airport is full" 
  end
  
  it "overrides default capacity" do
    airport = Airport.new(75)
    expect(airport.capacity).to eq 75
  end 
end 
