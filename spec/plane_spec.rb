require 'plane'

describe Plane do

  describe '#initialize' do
    it 'assumes plane is in the air' do
      expect(subject.in_air).to eq true
    end
  end

  describe '#landed'
  it 'plane has landed' do
    subject.landed
    expect(subject.in_air).to eq false
  end

  describe '#departed'
  it 'plane has departed' do
    subject.departed
    expect(subject.in_air).to eq true
  end
end
