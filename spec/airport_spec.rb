require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  describe "#takeoff" do
    it { is_expected.to respond_to('takeoff') }
# checks that the array is still active and thier are no extra planes
    it "removes a plane after it has taken off" do
      allow(subject).to receive(:stormy?) { false }
      expect { subject.takeoff }.to raise_error("There are no planes on the runway")
    end
# checks planes can still take off in non stormy weather
# Also checks that the tower recieves the number of planes left on the ground
    it "returns number of planes left on the runway at default" do
      allow(subject).to receive(:stormy?) { false }
      Airport::DEFAULT.times { subject.land(Plane.new) }
      expect(subject.takeoff).to eq(Airport::DEFAULT - 1)
    end

  end
  describe "#land" do
    it { is_expected.to respond_to('land') }

    # checks that the instance of the plane class is put into runway
    it "accepts a plane landing" do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.land(Plane.new)).to be_a(Array)
    end

      # checks for method land and checks that at default capacity to many planes
# cannot be landed. 
    it "Raises error if planes land at more than default capacity" do
      allow(subject).to receive(:stormy?) { false }
      Airport::DEFAULT.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("No space left on the runway")
    end
  end
  it { is_expected.to respond_to('land') }

  # checks that the instance of the plane class is put into runway
  it "accepts a plane landing" do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.land(Plane.new)).to be_a(Array)
  end

  # private method that ensures the tower can check how many planes are on the runway.
  describe '#confirm' do
    it 'returns the amount of planes left in the runway' do
      expect(subject.confirm).to be_a(Integer)
    end
  end

# checks to ensure that the default capcaity can be changed.
  it "Can have a non default capcity" do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end

  describe '#stormy?' do
    it "Returns true or false" do
      expect(subject.stormy?).to be(true) or be(false)
    end
  end
end

describe Plane do
end
