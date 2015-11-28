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

  it 'plane method plane_landing changes @plane_in_flight to Landed ' do
    plane = Plane.new
    plane.plane_landing
    expect(plane.instance_variable_get(:@plane_in_flight)).to eq('Landed')
  end

  it 'plane method plane taking off exists' do
    expect(Plane.new).to respond_to(:plane_taking_off)
  end

  it 'plane method plane_taking_off changes @plane_in_flight to In-Flight ' do
    plane = Plane.new
    plane.plane_landing
    plane.plane_taking_off
    expect(plane.instance_variable_get(:@plane_in_flight)).to eq('In-Flight')
  end

end
