require 'traffic_controller.rb'

describe TrafficController do
  it ' is a traffic controller' do
  end

  it 'instruct_landing' do
    plane_double = double
    expect(subject.instruct_landing(plane_double)).to respond_to
  end
end
