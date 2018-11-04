require 'aeroplane'

describe Aeroplane do

  it 'can tell it is in the air' do
    expect(subject.flying).to eq true
  end

  it 'can tell it is at an airport' do
    subject.land('An airport')
    expect(subject.airport).to eq 'An airport'
  end

  it 'can takeoff and know it is flying' do
    subject.land("An airport")
    expect(subject.takeoff).to eq 'flying'
  end
end
