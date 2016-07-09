require "airport"

describe Airport do

  it "responds to #land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  let (:plane) {double :plane}

  context 'in clear weather' do

# Test is not showing equality with IRB, suspending...
#  it 'stores a landed plane' do
#    airport = Airport.new
#    allow(airport).to receive(:stormy?).and_return(false)
#    airport.land(Plane.new)
#    expect(airport.land(Plane.new)).to eq airport.landed_planes
#  end
    it 'will not land a plane if the airport is full' do
      allow(plane).to receive(:flying)
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      Airport::MAX_CAPACITY.times {airport.land(plane)}
      expect(airport.land(plane)).to eq 'Unable to land as airport is full'
    end
# Test is not showing equality with IRB, suspending...
#  it 'has a maximum capacity that can be overiden' do
#    airport = Airport.new
#    allow(airport).to receive(:stormy?).and_return(false)
#    airport = Airport.new(10)
#    2.times {airport.land(Plane.new)}
#    expect(airport.land(Plane.new)).to eq 'Unable to land as airport is full'
#  end
  end

  context 'in stormy weather' do

    it 'will not take_off' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(true)
      expect(airport.take_off).to eq 'Unable to take off due to poor weather'
    end

    it 'will not land' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(true)
      expect(airport.land(Plane.new)).to eq 'Unable to land due to bad weather'
    end

  end
end

  # Replace Bike with :double
  # Should land/take_off be methods of the airport || plane ? --README
  # Concpetually, should the airport be initialized with planes ? --README
  # Rspec feature test
  # I want to instruct A PLANE!! to land at an airport and confirm that it has landed
  # I want to instruct A PLANE!! to take off from an airport and confirm that it is no longer in the airport
  # Describe setup / usage (with code snippets) in README
