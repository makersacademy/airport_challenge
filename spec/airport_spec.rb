require 'airport'
require 'plane'

describe Airport do

  it do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it do
    expect(subject).to respond_to(:plane)
  end

  it "can initialize a new airport" do
    expect(subject).to be_a(Airport)
  end

  it 'lands something' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'confirms landing' do
    plane = Plane.new
    expect { (subject.land(plane)) }.to output("Plane has landed").to_stdout 
  end


end
