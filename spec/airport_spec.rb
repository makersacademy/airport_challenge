# Land at airport when space and sunny - SUCCESS
# Land at airport when full and sunny - ERROR
# Land at airport when stormy - ERROR
# Land at airport twice with same plane - ERROR

# Check plane is in hanger after landing - SUCCESS

# Take off from airport when plane is present - SUCCESS
# Take off from airport when plane is not present - ERROR
# Take off from airport when stormy - ERROR

# Check airport has a default capacity when instatiated
# Check capacity of airport can be changed

require 'airport'

RSpec.describe Airport do

  context 'when a default airport is initialised' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it { expect(subject.hanger_capacity).to eq Airport::DEFAULT_HANGER_CAPACITY }
  end

  context 'when instantiating an airport with non-default capacity' do
    before(:all) do
      @small_airport = described_class.new(20)
    end
    it { expect(@small_airport.hanger_capacity).to eq 20 }
  end

  context 'when an airport has a plane landed in sunny weather' do
    before(:each) do
      @airport = described_class.new
      allow(@airport).to receive(:bad_weather?) { nil }
      @plane = Plane.new
      @airport.land(@plane)
    end
    it { expect(@airport.hanger[0]).to be_a(Plane) }
    it { expect(@airport.take_off(@plane)).to be @plane }
  end

  context 'confirm plane has left airport in sunny weather' do
    before(:each) do
      @airport = described_class.new
      allow(@airport).to receive(:bad_weather?) { nil }
      @plane = Plane.new
      @airport.land(@plane)
      @airport.take_off(@plane)
    end
    it { expect(@airport.hanger).not_to include @plane }
  end

  context 'when stormy weather' do
    before(:each) do
      @airport = described_class.new
      allow(@airport).to receive(:bad_weather?) { true }
    end
    it { expect { @airport.take_off(Plane.new) }.to raise_error("Too stormy for take off") }
    it { expect { @airport.land(Plane.new) }.to raise_error("Too stormy for landing") }
  end

  context 'when landing at full airport in sunny weather' do
    before(:each) do
      @airport = described_class.new
      allow(@airport).to receive(:bad_weather?) { nil }
      100.times { @airport.land(Plane.new) }
    end
    it { expect { @airport.land(Plane.new) }.to raise_error("Airport is full") }
  end

  context 'when non existent plane is told to take off' do
    before(:each) do
      @airport = described_class.new
      allow(@airport).to receive(:bad_weather?) { nil }
      @airport.land(Plane.new)
    end
    it { expect { @airport.take_off(Plane.new) }.to raise_error("Plane not in hanger") }
  end

  context 'when we try to land the same plane twice' do
    before(:each) do
      @airport = described_class.new
      allow(@airport).to receive(:bad_weather?) { nil }
      @plane = Plane.new
      @airport.land(@plane)
    end
    it { expect { @airport.land(@plane) }.to raise_error("Plane has already landed") }
  end
end
