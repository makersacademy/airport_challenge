require 'plane'

describe Plane do

  it 'responds to the method landed' do
    expect(subject).to respond_to(:land)
  end

  it 'plane flying is false when landed' do
    expect(subject.land).to be_falsy
  end

  it 'responds to the method taken-off' do
    expect(subject).to respond_to(:taken_off)
  end

  it 'plane flying is true when taken off' do
    expect(subject.taken_off).to be_truthy
  end

end
