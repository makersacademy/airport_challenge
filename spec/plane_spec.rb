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
  it 'if it is flying and lands, it is no longer flying' do
    expect(subject).to be_flying
    subject.land
    expect(subject).to_not be_flying
  end
  it 'if it is not flying and takes off, it is now flying' do
    subject.land
    expect(subject).to_not be_flying
    subject.take_off
    expect(subject).to be_flying
  end

end
