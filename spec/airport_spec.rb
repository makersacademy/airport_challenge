require 'airport'
require 'plane'

describe Airport do
#Responds to planes and weather
  it { is_expected.to respond_to :planes}
  it { is_expected.to respond_to :current_weather}

  it 'responds to land plane' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "raises an error when full" do
    @planes = []
    unless @planes.size != @capacity
      expect { subject.land(plane) }.to raise_error "Full Runway - Plane cannot land"
    end
  end

#Take planes in and out of the airport
  it "allows planes to take off and land" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to_not include plane
  end

#Does it work in bad weather?
  it 'does not take off in bad weather' do
    plane = Plane.new
    allow(subject).to receive(:current_weather)
    @current_weather == "stormy"
    unless @current_weather == "sunny"
      expect { subject.take_off(plane) }.to raise_error "Bad weather: No takeoff"
    end
  end

# Testing the capacity
  it { is_expected.to respond_to :capacity}
  it 'checks if capacity is an integer' do
    expect(subject.capacity).to be_a(Integer)
  end
end
