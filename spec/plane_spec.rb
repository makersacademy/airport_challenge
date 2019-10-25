require 'airport'
require 'plane'

describe Plane do
  it 'can confirm it has left the airport' do
    subject.left_airport
    expect(subject).to be_flying
  end
end
