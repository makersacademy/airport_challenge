require 'air_traffic_controller'

describe AirTrafficController do
  it 'Planes do not land if there is bad weather at airport' do
    a380 = double('a380')
    heathrow = double('heathrow', :iata_code => :LHR)
    srand(20)
    expect { subject.tell_plane_to_land({:airport => heathrow, :plane => a380}) }.to raise_error("Bad weather at LHR, plane cannot land!")
  end

  it 'Planes do not land if airport is at capacity' do
    a380 = double('a380')
    heathrow = double('heathrow', :iata_code => :LHR, :airport_at_capacity? => true)
    srand(2)
    expect { subject.tell_plane_to_land({:airport => heathrow, :plane => a380}) }.to raise_error("LHR at capacity, cannot land plane!")
  end

  it 'Planes land if no bad weather and airport has capacity' do
    a380 = double('a380', :cleared_to_land => nil, :in_flight => false, :flight_id => 1)
    heathrow = double('heathrow', :iata_code => :LHR, :airport_at_capacity? => false, :planes => [a380])
    srand(2)
    subject.tell_plane_to_land({:airport => heathrow, :plane => a380})
    expect(heathrow.planes).to eq [a380]
    expect(a380.in_flight).to eq false
  end

  it 'Planes do not depart if there is bad weather at airport' do
    a380 = double('a380')
    heathrow = double('heathrow', :iata_code => :LHR)
    srand(20)
    expect { subject.tell_plane_to_depart({:airport => heathrow, :plane => a380}) }.to raise_error("Bad weather at LHR, plane cannot take off!")
  end

  it 'Planes do not depart if they are not in the airport' do
    a380 = double('a380')
    heathrow = double('Airport', :iata_code => :LHR, :plane_departure_ready? => false)
    srand(2)
    expect { subject.tell_plane_to_depart({:airport => heathrow, :plane => a380}) }.to raise_error("Plane not at airport!")
  end

  it 'Planes depart if weather is good and they are ready to depart' do
    a380 = double('a380', :cleared_for_take_off => nil, :in_flight => true, :flight_id => 1)
    heathrow = double('Airport', :iata_code => :LHR, :plane_departure_ready? => true, :planes => [])
    srand(2)
    subject.tell_plane_to_depart({:airport => heathrow, :plane => a380})
    a380 = double('a380', :in_flight => true)
    expect(heathrow.planes).to eq []
    expect(a380.in_flight).to eq true
  end

  it 'Logs take offs and landings' do
    srand(2)
    a380 = double('a380', :in_flight => true, :cleared_to_land => nil, :flight_id => 1)
    heathrow = double('Airport', :iata_code => :LHR, :airport_at_capacity? => false)
    subject.tell_plane_to_land({:airport => heathrow, :plane => a380})

    a380 = double('a380', :cleared_for_take_off => nil, :in_flight => false, :flight_id => 1)
    heathrow = double('Airport', :iata_code => :LHR, :plane_departure_ready? => true, :planes => [a380])
    subject.tell_plane_to_depart({:airport => heathrow, :plane => a380})

    log = File.read("./logs/log.txt").split("\n")[-2, 2]
    expect(log).to eq ["#{Time.now} - User: #{subject.object_id} - Action: Flight #{a380.flight_id} cleared for landing at #{heathrow.iata_code}", "#{Time.now} - User: #{subject.object_id} - Action: Flight #{a380.flight_id} cleared for take off from #{heathrow.iata_code}"]
  end
end
