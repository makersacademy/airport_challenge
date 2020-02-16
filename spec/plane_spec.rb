require 'plane.rb'

describe Plane do

  describe '#landed' do
    it 'should show airborne flase when landed' do
      subject.landed
      expect(subject.airborne).to eq(false)
    end
  end

  describe '#in_flight' do
    it 'should show airborne true when in flight' do
      subject.in_flight
      expect(subject.airborne).to eq(true)
    end
  end
end
