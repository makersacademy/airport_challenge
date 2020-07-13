require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:plane) { double :plane, :landed= => false, landed?: false }
  let(:weather) { double :weather, :sunny= => true, sunny?: true }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :planes }

  it "checks to see if a new airport is empty of planes" do
    expect(subject.planes).to eq []
  end

  it "lands a plane at the airport and confirms" do
    subject.sunny = true
    allow(plane).to receive(:landed).and_return(false)
    expect(subject.land(plane)).to include(plane)
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "lands a plane then takes-off" do
    subject.sunny = true
    allow(plane).to receive(:landed).and_return(false)
    subject.land(plane)
    allow(plane).to receive(:landed).and_return(true)
    expect(subject.take_off(plane)).to eq plane
  end

  it "checks a plane flying is not landed" do
    subject.sunny = true
    allow(plane).to receive(:landed).and_return(false)
    subject.land(plane)
    allow(plane).to receive(:landed).and_return(true)
    subject.take_off(plane)
    expect(plane).to_not be_landed
  end

  it "confirms a plane that has taken off is no longer at the airport" do
    subject.sunny = true
    allow(plane).to receive(:landed).and_return(false)
    subject.land(plane)
    allow(plane).to receive(:landed).and_return(true)
    subject.take_off(plane)
    expect(subject.planes).to_not include(plane)
  end

  it "does not let a plane take-off if weather is stormy" do
    subject.sunny = true
    allow(plane).to receive(:landed).and_return(false)
    subject.land(plane)
    subject.sunny = false
    expect { subject.take_off(plane) }.to raise_error "Weather stormy: cannot take-off"
  end

  it "raises an error if the airport is full" do
    subject.sunny = true
    allow(plane).to receive(:landed).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Airport is full"
  end

  it "checks to see if you can fill, take-off a plane then fill airport" do
    subject.sunny = true
    allow(plane).to receive(:landed).and_return(false)
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    allow(plane).to receive(:landed).and_return(true)
    subject.take_off(plane)
    expect(subject.planes).to include(plane)
  end

  it "overrides default airport capacity" do
    expect(subject.capacity = 25).to eq 25
  end

end
