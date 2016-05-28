require 'airport'
require 'plane'

describe Airport do

  it "responds to a method"do
    expect(subject).to respond_to(:land).with(1).argument
    expect(subject).to respond_to(:depart).with(1).argument
    expect(subject).to respond_to(:plane)
  end

  it "can initialize a new airport" do
    expect(subject).to be_a(Airport)
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'departs a plane' do
    plane = Plane.new
    expect(subject.depart(plane)).to eq plane
  end

  it 'confirms landing' do
    plane = Plane.new
    expect { (subject.land(plane)) }.to output("Plane has landed\n").to_stdout
  end

  it 'confirms departure' do
    plane = Plane.new
    expect { (subject.depart(plane)) }.to output("Plane has departed\n").to_stdout
  end


end
