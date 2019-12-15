require 'airport'

describe Airport do
  it 'Responds to iata_code with relevant code' do
    heathrow = Airport.new('LTN')
    expect(heathrow.iata_code).to eq :LTN
  end

  it 'initializes with default airport code' do
    expect(subject.iata_code).to eq :LHR
  end

  it 'Doesnt allow non-available airports to be initialized' do
    expect{Airport.new('ABC')}.to raise_error("Airport not available, please enter allowed airport code.\nThe following airports are available: #{Airport::AVAILABLE_AIRPORTS.join(', ')}")
  end

  it 'Responds with true if airport is full' do
    heathrow = Airport.new('LHR', 2)
    plane = double("plane")
    2.times{heathrow.land_plane(plane)}
    expect(heathrow.airport_at_capacity?).to eq true
  end

  it 'Responds with false if airport has spaces' do
    plane = double("plane")
    2.times{subject.land_plane(plane)}
    expect(subject.airport_at_capacity?).to eq false
  end

  it 'Allows planes to be landed' do
    plane = double("plane")
    subject.land_plane(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'Checks whether a plane is departure ready' do
    plane = double("plane")
    expect(subject.plane_departure_ready?(plane)).to eq false
    subject.land_plane(plane)
    expect(subject.plane_departure_ready?(plane)).to eq true
  end

  it 'Checks plane has departed after recieving call from plane' do
    plane = double("plane", :in_flight? => true)
    subject.land_plane(plane)
    subject.plane_departed(plane)
    expect(subject.planes.include?(plane)).to eq false
    expect(plane.in_flight?).to eq true
  end
end
