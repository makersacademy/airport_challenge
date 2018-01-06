require 'plane'
require 'airport'

describe Plane do
  it 'can create instances of Plane class' do
    expect(subject).to be_instance_of(Plane)
  end
  it 'can land at an airport' do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes[0]).to eq(subject)
  end
end
