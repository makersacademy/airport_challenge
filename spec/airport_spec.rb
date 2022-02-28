require 'airport'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new }
  subject(:heathrow) { described_class.new }
  subject(:gatwick) {described_class.new}
  let(:plane) { double :plane }
  before do
    allow(plane).to receive(:land)
    allow(plane).to receive(:takeoff)
    allow(plane).to receive(:log_airport).and_return("fake airport")
    allow(plane).to receive(:change_status_to_flying).and_return(:flying)
  end

  # it 'responds to land with 1 argument passed' do
  #   expect(subject).to respond_to(:land).with(1).argument
  # end

  # Commend out - not sure if this is needed with new take-off tests. Might need to use some stubs
  # it 'takes off a plane and confirms it has taken off' do # I'm not sure if this test and corresponding method is doing too much
  #   plane = Plane.new
  #   subject.land(plane)
  #   expect(subject.takeoff(plane)).to eq("#{plane} has taken off")
  # end

  # I don't like what  I've done here - feel like it's overly complicated,
  # baking in a bunch of behaviour from different classes, etc. Need to 
  # speak to a coach
  # - are the methods take_off and land trying to do too much? 
  it 'checks that a plane is no longer at the airport after take-off' do
    plane.stub(:whereabouts).and_return(:flying)
    plane.whereabouts
    airport.land(plane)
    plane.stub(:whereabouts).and_return("fake airport id")
    airport.takeoff(plane)
    plane.stub(:whereabouts).and_return(:flying)
    expect(airport.planes_at_airport).not_to include plane
  end

  it 'raises an error if plane tries to take off from an airport it is not at' do
    plane.stub(:whereabouts).and_return(:flying)
    airport.land(plane)
    allow(plane).to receive(:whereabouts).and_return(:airport.object_id)
    airport.takeoff(plane) # plane now already in the air
    expect { airport.takeoff(plane) }.to raise_error "Plane is not at this airport"
  end

  it 'raises an error if a plane tries to land when it is already on the ground' do
    plane.stub(:whereabouts).and_return(:flying)
    heathrow.land(plane)
    error_message = "Plane cannot land as it is already on the ground"
    expect { gatwick.land(plane) }.to raise_error error_message
  end

  it "won't accept more planes than the airport capacity" do
    airport.capacity.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport is at capacity"
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'uses capacity when specified' do
    capacity = 20
    capacity_test_airport = Airport.new(20)
    expect(capacity_test_airport.capacity).to eq capacity
  end

  it 'raises an error if a plane tries to take-off in stormy weather' do
    airport.land(plane)
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(true)
    expect{ airport.takeoff(plane) }.to raise_error "Plane cannot take off due to stormy weather"
  end
end
