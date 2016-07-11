require 'plane'

describe Plane do

  it 'confirms the plane has landed' do
    subject.land
    expect(subject).to be_landed
  end
  it 'confirms the plane has taken off ' do
    subject.take_off
    expect(subject).to be_taken_off
  end

end
