require './lib/plane'

describe Plane do

  it 'is of class Plane' do
    expect(subject).to be_instance_of Plane
  end

  it 'should be able to land' do
    expect(subject).to respond_to :land
  end
end
