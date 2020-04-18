require 'air_traffic_controller'
require 'plane'

describe Plane do
  it 'plane responds to confirm_status method' do
    expect(subject).to respond_to(:confirm_status)
  end
end

describe Airport do
  it 'Airport responds to land method with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Airport responds to take off method' do
    expect(subject).to respond_to(:take_off)
  end
end
