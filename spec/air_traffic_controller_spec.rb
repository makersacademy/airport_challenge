require 'air_traffic_controller'

describe AirTrafficController do
  it 'Planes do not land if there is bad weather at airport' do
    a380 = double('Plane')
    heathrow = double('Airport', :iata_code => :LHR)
    srand(2)
    expect{subject.tell_plane_to_land(heathrow, a380)}.to raise_error("Bad weather at LHR, cannot land plane!")
  end

end
