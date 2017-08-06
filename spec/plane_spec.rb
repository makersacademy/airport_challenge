require_relative '../lib/plane'
describe Plane do
  it 'responds to "land" method' do
    expect(subject).to respond_to(:land)
  end
  it 'can land at airport' do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes.include? subject).to be true
  end
end