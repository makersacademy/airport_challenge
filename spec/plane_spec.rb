require 'plane'

describe Plane do

  describe '#initialize' do
    it 'assumes plane is in the air' do
      expect(subject.in_air).to eq true
    end
  end

  describe '#landed'
  it 'assumes plane has landed' do
    subject.landed
      expect(subject.in_air).to eq false
  end
end
