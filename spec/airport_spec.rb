require 'airport'

describe Airport do

  let(:gatwick) { Airport.new }
  let(:plane_1) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:weather) }

  it "raises error when trying to take off a plane in stormy weather" do
    allow(gatwick).to receive(:weather) { :stormy }
    expect { gatwick.take_off(plane_1) }.to raise_error "Cannot take off due to stormy weather"
  end 

  it "raises error when trying to land a plane in stormy weather" do
    allow(gatwick).to receive(:weather) { :stormy }
    expect { gatwick.land(plane_1) }.to raise_error "Cannot land due to stormy weather"
  end 

  it "adds plane to planes array" do
    allow(gatwick).to receive(:weather) { :sunny }
    gatwick.land(plane_1) 
    expect(gatwick.planes.pop).to eq(plane_1)
  end

  it "raises error when trying to land a plane at a full airport" do
    allow(gatwick).to receive(:weather) { :sunny }
    gatwick.capacity.times { gatwick.land(Plane.new) }
    expect { gatwick.land(plane_1) }.to raise_error "Cannot land - airport full"
  end

  it "has capacity that can be set on initialization" do
    Heathrow = Airport.new(7)
    expect(Heathrow.capacity).to eq(7)
  end 
end
