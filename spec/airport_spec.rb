require 'airport'

describe Airport do

  let(:gatwick) { Airport.new }
  let(:plane_1) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:weather) }

  it "raises error when trying to take off in stormy weather" do
    allow(gatwick).to receive(:weather) { 'stormy' }
    expect { gatwick.take_off(plane_1) }.to raise_error "Cannot take off due to stormy weather"
  end 

  it "raises error when trying to land in stormy weather" do
    allow(gatwick).to receive(:weather) { 'stormy' }
    expect { gatwick.land(plane_1) }.to raise_error "Cannot land due to stormy weather"
  end 
end 
