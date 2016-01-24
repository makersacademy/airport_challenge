require 'plane'

describe Plane do

  it 'errors if the plane has already landed' do
    subject.land
    expect{subject.land}.to raise_error 'plane already landed'
  end

  it 'errors if the plane is already flying' do
    subject.land
    subject.fly
    expect{subject.fly}.to raise_error 'plane already flying'
  end

end
