require 'plane'

describe Plane do
  it 'changes its status to true after landing' do
    subject.land
    expect(subject.landed?).to eq true
  end

  it 'changes its status to true after taking off' do
    subject.take_off
    expect(subject.taken_off?).to eq true
  end

  it 'cannot take off if the plane is flying' do
    plane = subject
    plane.take_off
    expect{ subject.take_off }.to raise_error
    #expect(plane.taken_off?).to eq false
  end

  it 'cannot land if the plane is not flying' do
    plane = subject
    plane.land
    expect{ subject.land }.to raise_error
    #expect(plane.taken_off?).to eq false
  end
end
