require 'air_traffic_controller'


describe AirTrafficController do
  it 'Planes do not land if there is bad weather at airport' do
    a380 = double('Plane')
    heathrow = double('Airport', :iata_code => :LHR)
    srand(2)
    expect{subject.tell_plane_to_land(heathrow, a380)}.to raise_error("Bad weather at LHR, cannot land plane!")
  end

  it 'Planes do not land if airport is at capacity' do
    a380 = double('Plane')
    heathrow = double('Airport', :iata_code => :LHR, :airport_at_capacity? => true)
    srand(4)
    expect{subject.tell_plane_to_land(heathrow, a380)}.to raise_error("LHR at capacity, cannot land plane!")
  end

  it 'Planes land if no bad weather and airport has capacity' do
    a380 = double('Plane', :cleared_to_land => nil, :in_flight => false)
    heathrow = double('Airport', :iata_code => :LHR, :airport_at_capacity? => false, :planes => [a380])
    srand(4)
    subject.tell_plane_to_land(heathrow, a380)
    expect(heathrow.planes).to eq [a380]
    expect(a380.in_flight).to eq false
  end

end

# require 'airport'
# require 'plane'
# a380 = Plane.new
# heathrow = Airport.new('LHR')
