require 'plane'
describe Plane do
  it 'an instance of plane is any integer' do
    expect(subject.plane).to be_an(Integer)
  end
end
