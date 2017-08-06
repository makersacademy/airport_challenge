require_relative '../lib/plane'

describe Plane do
  it 'responds to "land" method' do
    expect(subject).to respond_to(:land)
  end

  it 'can land at airport' do
    airport = Airport.new
    subject.land_at_airport(airport)
    expect(airport.planes.include? subject).to eq true
  end

  it 'cannot land if already landed' do
    subject.land_at_airport(Airport.new)
    expect {subject.land_at_airport(Airport.new)}.to raise_error 'Plane already landed'
  end

  it 'cannot takeoff if already in the air' do
    subject.takeoff
    expect(subject.takeoff).to eq false
  end
end