require 'airport'

describe Airport do
  let(:weather) { double :weather, stormy?: false }#, stormy? => false }
  subject { Airport.new weather }

  it { expect(subject).to respond_to(:land).with(1).argument }

  it "Instructs a plane to land" do
    expect(subject.land(Plane.new)).to eq("Plane has landed.")
  end

  it { expect(subject).to respond_to(:takeoff).with(1).argument }

  it "Instructs a plane to take off" do
    expect(subject.takeoff(Plane.new)).to eq("Plane has taken off.")
  end

  it "prevents takeoff when the weather is stromy" do
    #weather.stub(:stormy?) { true }
    allow(weather).to receive(:stormy?).and_return(true)
    expect { subject.takeoff(Plane.new) }.to raise_error("Too stormy for takeoff.")
  end

end
