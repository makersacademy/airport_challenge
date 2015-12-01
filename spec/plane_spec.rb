require_relative '../lib/plane.rb'

describe Plane do

  it 'plane has a state plane_in_flight(instance variable)' do
    expect(subject.instance_variable_get(:@plane_in_flight)).to be 
  end

  it 'plane method plane landing exists' do
    expect(subject).to respond_to(:plane_landing)
  end

  it 'plane method plane_landing changes @plane_in_flight to Landed ' do
    subject.plane_landing
    expect(subject.instance_variable_get(:@plane_in_flight)).to eq('Landed')
  end

  it 'plane method plane taking off exists' do
    expect(subject).to respond_to(:plane_taking_off)
  end

  it 'plane method plane_taking_off changes @plane_in_flight to In-Flight ' do

    subject.plane_landing
    subject.plane_taking_off
    expect(subject.instance_variable_get(:@plane_in_flight)).to eq('In-Flight')
  end

end
