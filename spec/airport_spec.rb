require 'airport'

describe Airport do

  it 'lands a plane' do
    plane = 'plane'
    expect(subject.land(plane)).to eq [plane]
  end

  it 'checks if a specific plane has landed' do
    plane = 'plane'
    subject.land(plane)
    expect(subject.landed?(plane)).to eq true
  end

  it 'causes a plane to take off' do
    ba = 'BA'
    aerlingus = 'Aer Lingus'
    subject.land(ba)
    subject.land(aerlingus)
    expect(subject.take_off(ba)).to eq ba
  end

  it 'expects the plane to have taken off' do
    ba = 'BA'
    aerlingus = 'Aer Lingus'
    subject.land(ba)
    subject.land(aerlingus)
    subject.take_off(ba)
    expect(subject.landed?(ba)).to eq false
    expect(subject.landed?(aerlingus)).to eq true
  end

end
