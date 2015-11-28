require_relative '../lib/plane.rb'

describe Plane do

  it 'plane object exists' do
    expect(Plane.new).to be
  end

  it 'plane has a state plane_in_flight(instance variable)' do
    expect(Plane.new.instance_variable_get(:@plane_in_flight)).to be
  end

end
