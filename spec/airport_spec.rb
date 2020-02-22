require 'airport'

describe Airport do

  before(:each) do

  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it "capacity can be overridden if appropriate" do
    airport = Airport.new 15
    expect(airport.capacity).to eq 15
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "prevents landing when the airport if full" do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error "Airport has reached capacity: Cannot land plane"
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "confirms that plane is no longer in the airport" do
      expect(subject.take_off("Plane")).to eq "Plane is no longer in the airport"
    end
  end

end
