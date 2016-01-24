require 'plane'

describe Plane do

  it 'has a Plane class' do
    expect(subject).to be_a(Plane)
  end

  it 'can respond to \'land\' method with an argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  let(:airport) { double :airport }

  it 'can land at airport' do
    plane = Plane.new
    allow(airport).to receive(:stored_planes).and_return(Array.new)
    plane.land(airport)
    expect(airport.stored_planes).to eq([plane])
  end

end
