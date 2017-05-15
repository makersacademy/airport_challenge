require_relative '../lib/plane'

describe Plane do

  it 'can land at airports' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'can take off from airports' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'will not land at airports if it is already landed, even if the airport attempts to gives it clearance' do
    airport = double(:airport, planes_currently_landed: [subject])
    subject.instance_variable_set("@status", :landed)
    subject.instance_variable_set("@cleared", true)
    expect { subject.land(airport) }.to raise_error(PlaneStatusError)
  end

  it 'will not take off from airports if it is already flying, even if the airport attempts to gives it clearance' do
    airport = double(:airport, planes_currently_landed: [])
    subject.instance_variable_set("@cleared", true)
    expect { subject.take_off(double(:airport)) }.to raise_error(PlaneStatusError)
  end
end
