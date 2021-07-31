require 'plane.rb'

describe Plane do
  it 'creates new plane object' do
    expect(Plane.new('LX 810')).to be_instance_of Plane
  end
end

