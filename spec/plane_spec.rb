require 'airport'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  it "cannot take off if it's flying" do
    allow(subject).to receive(:flying?).and_return(true)
    expect { subject.takeoff }.to raise_error "Plane is already flying"
  end
  it "cannot land if it's already on the ground" do
    allow(subject).to receive(:flying?).and_return(false)
    expect { subject.land }.to raise_error "Plane is on the ground"
  end

end
