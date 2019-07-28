require 'airport'
describe Airport do
  let(:plane) {double :plane}

  it 'planes can land at airport' do
    expect(subject).to respond_to :land
  end

  it 'planes can take off from airport' do
    expect(subject).to respond_to :take_off
  end

  it 'there should be a method to set the weather at the airport' do
    expect(subject).to respond_to :weather
  end

  it 'A plane should not take off if weather is stormy' do
    plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
    allow(subject).to receive(:weather).and_return("clear")
    subject.land(plane)
    allow(subject).to receive(:weather).and_return("stormy")
    expect{subject.take_off(plane)}.to raise_error("no flights while weather is stormy")
  end

  it 'A plane should not land when weather is stormy' do
    plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
    allow(subject).to receive(:weather).and_return("stormy")
    expect{subject.land(plane)}.to raise_error("no landing while weather is stormy")
  end

  it 'while landing a plane flight collection increases' do
    plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
    allow(subject).to receive(:weather).and_return("clear")
    subject.land(plane)
    expect(subject.planes.count).to eq 1
  end

  it 'while chartering a flight collection is depleted' do
    plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
    allow(subject).to receive(:weather).and_return("clear")
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes.count).to eq 0
  end

  it 'when a plane tries to land in a full airport' do
    plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
    allow(subject).to receive(:weather).and_return("clear")
    10.times{subject.land(plane)}
    expect{subject.land(plane)}.to raise_error("cannot land while airport is full")
  end

  it 'when setting the capacity of an airport' do
    plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
    heathrow = Airport.new(30)
    allow(heathrow).to receive(:weather).and_return("clear")
    30.times{heathrow.land(plane)}
    expect{heathrow.land(plane)}.to raise_error("cannot land while airport is full")
  end

  it 'when taking off from an empty airport' do
    plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
    allow(subject).to receive(:weather).and_return("clear")
    expect{subject.take_off(plane)}.to raise_error "that plane is not in this airport"
  end

  it 'planes take off from another airport' do
    plane = double(:plane, flight_check: true, change_location: true, landing_check: true)
    heathrow = Airport.new
    allow(heathrow).to receive(:weather).and_return("clear")
    gatwick = Airport.new
    allow(gatwick).to receive(:weather).and_return("clear")
    heathrow.land(plane)
    expect{gatwick.take_off(plane)}.to raise_error("that plane is not in this airport")
  end






  ### Redundent Tests

  ## cannot place planes into airports without setting their location to grounded
  # it 'when attempting to take off a plane which is already in transit' do
  #   subject.land(Plane.new)
  #   expect{subject.take_off}.to raise_error 'cannot take off while plane is in transit'
  # end

  ## Included within Plane class
  # it 'when attempting to land a grounded plane' do
  #   plane = double(:plane, landing_check: true, change_location: true)
  #   expect{subject.land(plane)}.to raise_error "cannot land a plane which is already grounded"
  # end
end