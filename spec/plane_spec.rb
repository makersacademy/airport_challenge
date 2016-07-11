require 'plane'

describe Plane do
  it 'has landed' do
    subject.land
    expect(subject.landed?).to eq true
  end

  it 'has departed' do
    subject.depart
    expect(subject.landed?).to eq false
  end
end
