require 'plane'

describe Plane do

  describe '#landed' do
    it 'responds to landed method' do
    expect(subject).to respond_to(:landed)
    end
  end

  # describe '#is_where method' do
  #   it 'responds to is_where? method' do
  #   expect(subject).to respond_to(:is_where?)
  #   end

  #   it 'returns current location of plane when called on landed plane' do
  #   airport = Airport.new
  #   subject.land(airport)
  #   expect(subject.is_where?).to eq airport
  #   end

end