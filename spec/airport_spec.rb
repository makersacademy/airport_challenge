require 'Airport'
describe Airport do
  it 'lands a plane' do
    new = Airport.new
    new.land('croissant')
    expect(new.airport).to include('croissant')
  end
  it 'plane leaves the airport, airport has no plane' do
    new = Airport.new
    new.land('croissant')
    new.leave_airport
    expect(new.airport).to_not include('croissant')
    # expect(new.airport).to be_empty
  end
  it 'should only allow 5 planes' do
    new = Airport.new
    new.land('croissant')
    expect {new.airport}
  end
end