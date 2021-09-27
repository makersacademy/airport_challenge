require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it 'responds to the method full?' do
    expect(subject).to respond_to(:full?)
  end

  it 'responds to the takeoff method' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'responds to the land method' do
    expect(subject).to respond_to(:land)
  end
end

describe "#takeoff" do

  # before (:each) do
  #   airport =  Airport.new
  #   plane = Plane.new
  # end

  it 'allows a plane to take off from the airport when weather is clear' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    allow(airport).to receive(:weather_station).and_return(true)
    expect(airport.takeoff(plane)).to eq plane
  end
end

describe "#land" do
  it 'lands a plane at the airport' do
    airport = Airport.new
    airport.land(Plane.new)
    expect(airport.airport.length).to eq 1
  end
end

describe "#check_hangers" do
  it 'should return an error message when no planes present' do
    @airport = Airport.new
    expect { @airport.check_hangers }.to raise_error("No Planes.")
  end
end

describe "#full" do
  before(:each) do
    @airport = Airport.new
  end

  it 'should return false if airport is not full' do
    expect(@airport.full?).to eq false 
  end

  describe 'initialization' do

    it 'has a variable capacity' do
      airport = Airport.new 10
      10.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "No space"
    end
  end
  
  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'has a default capacity' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(Plane.new) }.to raise_error "No space"
    end
  end
end
