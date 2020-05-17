require 'plane'

describe Plane do
  subject { Plane.new }

  let(:airport) { Airport.new }

  it "needs to be assigned an aiport" do
    expect(subject.instance_variable_get(:@plane_stored)).to be_nil
  end

  it 'once plane stored, it is at located at that airport' do
    allow(airport).to receive(:rand) { 5 }
    subject.land(airport)
    expect(subject.instance_variable_get(:@plane_stored)).to eq(airport)
  end

  it "allows a plane to land" do
    expect(subject).to respond_to(:land)
  end

  it "allows a plane to take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "prevents departure when weather is stormy" do
    allow(airport).to receive(:rand) { 5 }
    subject.land(airport)
    allow(airport).to receive(:rand) { 7 }
    expect { subject.take_off(airport) }.to raise_error("Storm Forecast!")
  end

  it "prevents landing when weather is stormy" do
    allow(airport).to receive(:rand) { 7 }
    expect { subject.land(airport) }.to raise_error("Storm Forecast!")
  end

  it 'alerts when plane trying to take off from airport not stored at' do
    allow(airport).to receive(:rand) { 5 }
    expect { subject.take_off(airport) }.to raise_error("Plane not docked at #{airport}")
  end

  it 'alerts when plane trying to land at airport it is stored at' do
    gatwick = Airport.new
    allow(gatwick).to receive(:rand) { 5 }
    subject.land(gatwick)
    expect { subject.land(airport) }.to raise_error("Plane already stored at #{gatwick}")
  end
end
