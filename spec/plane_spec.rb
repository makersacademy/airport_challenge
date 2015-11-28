require_relative '../lib/plane.rb'

describe Plane do

  it 'plane object exists' do
    expect(Plane.new).to be
  end

  it 'plane has a state plane_in_flight(instance variable)' do
    expect(Plane.new.instance_variable_get(:@plane_in_flight)).to be
  end

  it 'plane method plane landing exists' do
    expect(Plane.new).to respond_to(:plane_landing)
  end

  it 'plane method plane taking off exists' do
    expect(Plane.new).to respond_to(:plane_taking_off)
  end

end
