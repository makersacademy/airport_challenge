require 'plane'

describe Plane do

  it 'should confirm the plane has landed' do
    plane = double(:plane)
    subject.land
    expect(subject).to be_landed
  end

end
