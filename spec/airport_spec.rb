require 'airport'
require 'plane'

describe Airport do

  it do
    expect(subject).to respond_to(:land).with(1).argument
    expect(subject).to respond_to(:depart).with(1).argument
  end

  it do
    expect(subject).to respond_to(:plane)
  end

  it "can initialize a new airport" do
    expect(subject).to be_a(Airport)
  end

  it 'lands / departs something' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
    expect(subject.depart(plane)).to eq plane
  end

  it 'confirms landing / departure' do
    plane = Plane.new
    expect { (subject.land(plane)) }.to output("Plane has landed").to_stdout
    expect { (subject.depart(plane)) }.to output("Plane has departed").to_stdout
  end


end
