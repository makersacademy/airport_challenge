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
    it "the airport has the plane after it has landed" do
      plane = Plane.new
      allow(subject.weather).to receive(:stormy?) { false }
      expect(subject.land plane).to include plane
    end
    it "prevents landing when the airport if full" do
      allow(subject.weather).to receive(:stormy?) { false }
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error "Airport has reached capacity: Cannot land plane"
    end
    it "prevents landing when the weather is stormy" do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.land Plane.new }.to raise_error "It is unsafe to land due to stormy conditions"
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it "confirms that plane is no longer in the airport" do
      subject.instance_variable_set(:@planes, [Plane.new])
      allow(subject.weather).to receive(:stormy?) { false }
      expect(subject.take_off).to match(/is no longer in the airport/)
    end
    it "will return an error if there are no planes in the airport" do
      expect { subject.take_off }.to raise_error "There are no planes in the airport!"
    end
    it "will return an error in stormy conditions" do
      subject.instance_variable_set(:@planes, [Plane.new])
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.take_off }.to raise_error "It is unsafe to take off due to stormy conditions"
    end
  end

end
