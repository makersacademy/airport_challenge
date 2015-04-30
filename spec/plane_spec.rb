require 'plane'
describe Plane do

  it 'has a flying status when created' do
    expect(subject.flying?).to be true
  end

  it 'can land, and become landed' do
    subject.land!
    expect(subject.flying?).to be false
  end

  it 'can not land when already landed' do
    subject.land!
    expect { subject.land! }.to raise_error 'Already Landed'
  end

  it 'can fly and change the status' do
    subject.land!
    subject.fly!
    expect(subject.flying?).to be true
  end

  it 'can not fly when left airport' do
    expect { subject.fly! }.to raise_error 'Already Flying'
  end
end
