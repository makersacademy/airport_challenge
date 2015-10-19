require 'Plane'

describe Plane do

  it 'landing changes status' do
    subject.land
    expect(subject.status).to eq :grounded
  end

  it 'take off changes status' do
    expect(subject.status).to eq :flying
  end

  it 'raises error when attempting to take off if already flying' do
    expect {subject.take_off}.to raise_error "Plane already in flight!"
  end

  it 'raises error when attempting to land if already on the ground' do
    subject.land
    expect {subject.land}.to raise_error "Plane is already on the ground!"
  end
end
