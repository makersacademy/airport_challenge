require "airport"
# set the weather to sunny automatically or all tests
RSpec.configure do |config|
  config.before(:each) do
    allow(subject).to receive(:weather) { "sunny" }
  end
end

describe Airport do
  let(:plane) { Plane.new }

  it "Tests if a plane can land" do
    expect(subject).to respond_to :land
  end

  it "Tests if plane goes into hanger after landing" do
    expect { subject.land(plane) }.to change { subject.hanger.last }.to(plane)
  end

  it "Tests if a plane can takeoff" do
    expect(subject).to respond_to :takeoff
  end

  it "Tests if the plane is no longer in the hanger after takeoff" do
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.hanger).not_to include(plane)
  end

  it "Receives error if airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) } # does this land the same plane 10 times?
    expect { subject.land(plane) }.to raise_error(RuntimeError, "The airport is full.")
  end

  it { is_expected.to respond_to :change_capacity }

  it "Capacity changes when change_capcaity is called" do 
    new_capacity = 50
    subject.change_capacity(new_capacity)
    expect(subject.capacity).to eq new_capacity
  end

  it "Receives error landing if weather is stormy" do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.land(plane) }.to raise_error(RuntimeError, "The weather is stormy, no planes can land.")
  end

  it "Receives error taking off if weather is stormy" do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.takeoff(plane) }.to raise_error(RuntimeError, "The weather is stormy, no planes can takeoff.")
  end

end
