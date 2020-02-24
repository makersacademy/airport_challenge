require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  before(:each) do
    allow(subject.weather).to receive(:stormy?) { false }
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
    it "the airport has the plane after it has landed" do
      expect(subject.land plane).to include plane
    end
    it "prevents landing when the airport if full" do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land plane }.to raise_error "Airport has reached capacity: Cannot land plane"
    end
    it "prevents landing when the weather is stormy" do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.land plane }.to raise_error "It is unsafe to land due to stormy conditions"
    end
    it "prevents landing if plane is already in airport" do
      subject.instance_variable_set(:@planes, [plane])
      expect { subject.land plane }.to raise_error "This plane is already in the airport!"
    end
  end

  describe '#take_off' do

    before(:each) { subject.instance_variable_set(:@planes, [@plane]) }

    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "plane is not in airport once it has taken off" do
      subject.instance_variable_set(:@planes, [Plane.new, @plane, Plane.new])
      subject.take_off(@plane)
      expect(subject.planes).not_to include @plane
    end
    it "confirms that plane is no longer in the airport" do
      expect(subject.take_off(@plane)).to match(/is no longer in the airport/)
    end
    it "will return an error if there are no planes in the airport" do
      subject.instance_variable_set(:@planes, [])
      expect { subject.take_off(@plane) }.to raise_error "There are no planes in the airport!"
    end
    it "will return an error in stormy conditions" do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.take_off(@plane) }.to raise_error "It is unsafe to take off due to stormy conditions"
    end
    it "will return an error if plane is not in the airport" do
      expect { subject.take_off(Plane.new) }.to raise_error "This plane is not in the airport"
    end
  end

end
