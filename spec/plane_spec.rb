require 'plane'

describe Plane do
  subject { described_class.new }
  let(:airport) { double(:airport, :name => "CDG", :ready_for_landing? => \
  true, :ready_for_taking_off? => true, :planes => [subject]) }
  let(:other_airport) { double(:airport, :planes => []) }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :land }
  
  before(:each) do
    allow(airport).to receive(:receive_plane)
    allow(airport).to receive(:release_plane)
  end
  
  it "when initialize status is :landed" do
    expect(subject.status).to eq :landed
  end
  
  it "flies after taking off" do
    expect(subject.status).to eq :landed
    subject.take_off(airport)
    expect(subject.status).to eq :flying
  end
  
  it "is at the airport after landing" do
    subject.take_off(airport)
    expect(subject.status).to eq :flying
    subject.land(airport)
    expect(subject.status).to eq :landed
  end
  
  it "a landed plane cannot land again" do
    expect(subject.land(airport)).to eq "Plane #{subject} is already landed"
  end
  
  it "a plane cannot land in a full airport" do
    subject.take_off(airport)
    allow(airport).to receive(:ready_for_landing?).and_return false
    subject.land(airport)
    expect(subject.status).to be :flying
  end
  
  it "raises error if plane is at a different airport" do
    msg = "The plane is at another airport. Cannot take off from this location!"
    allow(other_airport.planes).to receive(:include?).and_return false
    subject.take_off(other_airport)
  end
end