require 'plane'

describe Plane do
  let(:airport) { double :airport }
  let(:another_airport) { double :another_airport }
  let(:landed_plane) { Plane.new(airport) }

  it "Is an instance of the plane class" do
    expect(subject).to be_instance_of(Plane)
  end

  it "Is not landed at any airport after default instantiation (i.e. has airport attribute set to default of -1)" do
    expect(subject.landed_at).to eq(-1)
  end

  it "Is is landed at airport after being given the airport as an argument at instantiation" do
    expect(landed_plane.landed_at).to eq(airport)
  end

  context "#land" do
    it "Will be landed at an airport after landing there (if it was not already landed when method was called)" do
      subject.land(airport)
      expect(subject.landed_at).to eq(airport)
    end

    it "Will raise an error if asked to land when already landed" do
      expect { 2.times { subject.land(airport) } }.to raise_error(StandardError)
    end
  end

  context "#take_off" do
    it "Will take off when told to take off from correct airport" do
      landed_plane.take_off(airport)
      expect(landed_plane.landed_at).to eq(-1)
    end

    it "Will raise an error when told to take off from wrong airport" do
      expect { landed_plane.take_off(another_airport) }.to raise_error(StandardError)
    end

    it "Will raise an error when told to take off when not at an airport" do
      expect { subject.take_off(airport) }.to raise_error(StandardError)
    end

  end

end
