require 'plane'

describe Plane do

  describe 'initialization' do
    it 'is a flying plane by defualt' do
      expect(subject.landed?).to eq false
    end
  end

  it 'can be confirmed as landed' do
    subject.land_status
    expect(subject.landed?).to eq true
  end

  it 'can be confirmed as departed' do
    subject.departure_status
    expect(subject.landed?).to eq false
  end

end