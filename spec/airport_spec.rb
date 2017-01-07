require 'airport'

describe Airport do

  it 'responds to the method land' do
    expect(subject).to respond_to(:land)
  end

  it 'gets a plane and expects it to respond to landed' do
    plane = subject.land
    expect(plane).to be_landed
  end

end
