require 'plane'

describe Plane do
  it 'can fly' do
    expect(subject).to be_flying
  end
  it 'can be not flying/it can land' do
    subject.land
    expect(subject).to_not be_flying
  end
  it 'can take off' do
    subject.land
    subject.take_off
    expect(subject).to be_flying
  end
  it 'can report whether or not it is flying' do
    expect(subject.flying?).to be(true).or be(false)
  end
end
