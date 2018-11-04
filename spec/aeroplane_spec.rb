require 'aeroplane'

describe Aeroplane do

  it 'can tell it is in the air' do
    expect(subject.status).to eq 'flying'
  end

  it 'can tell it is at an airport' do
    subject.land('An airport')
    expect(subject.airport).to eq 'An airport'
  end

  it 'can takeoff and know it is flying' do
    subject.land
    expect(subject.takeoff).to eq 'flying'
  end
end
