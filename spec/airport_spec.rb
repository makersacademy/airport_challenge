require 'airport'
require 'plane'

describe Airport do

#Responds to planes and weather
  it { is_expected.to respond_to :planes}

  it 'responds to land plane' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "raises an error when full" do
    20.times { @planes << Plane.new }
    plane = Plane
    expect {subject.land(plane) }.to raise_error "Full Runway - Plane cannot land"
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
    _plane = Plane.new
    allow(subject.take_off(_plane)).to receive(subject.weather).and_return("stormy")
    expect{subject.take_off(_plane) }.to raise_error "Bad weather: No takeoff"
    end

end
