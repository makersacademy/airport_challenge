require 'plane'

describe Plane do

  it 'has a flying status when created' do
    expect(subject.flying?).to be true
  end

  it 'can land, and change its status' do
    subject.land!
    expect(subject.flying?).to be false
  end

  it 'cannot land when it is already landed' do
    subject.land!
    expect { subject.land! }.to raise_error 'Already Landed'
  end

  it 'can take off and change its status to flying' do
    subject.land!
    subject.take_off!
    expect(subject.flying?).to be true
  end

  it 'cannot take off when it is already flying' do
    expect { subject.take_off! }.to raise_error 'Already Flying'
  end
end
