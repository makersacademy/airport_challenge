require 'airport'

describe Airport do
  
  let(:plane) { double(plane) }

  it "can #park" do
    expect(subject).to respond_to(:park)
  end

  it "can store planes with #park" do
    airport = Airport.new
    airport.park("plane")
    expect(airport.planes.empty?).to eq false
  end
  
end
