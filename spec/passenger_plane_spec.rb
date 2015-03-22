require 'plane'
require 'passenger_plane'

describe PassengerPlane do
  it 'is a plane' do
    PassengerPlane.class.ancestors.include? Plane
  end

  it 'has a list of expected passengers' do
    expect(subject).to respond_to :expected_passengers
  end

  xit 'can accept boarding passengers'
  xit 'can check if passengers are missing'
end
