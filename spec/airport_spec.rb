require 'airport'


class FakePlane

end

describe Airport do
  describe "landing plane tests" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "returns the landed plane" do
      plane = FakePlane.new
      expect(subject.land(plane)).to eq plane
    end

    it "raises an error when you try to land the same plane twice" do
      plane = FakePlane.new
      subject.land(plane)
      expect { subject.land plane }.to raise_error "Cannot land the same plane"
    end
  end

  describe "capacity tests" do
    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'raises an error when airport is full' do
      subject.capacity.times { subject.land(FakePlane.new) }
      expect {subject.land FakePlane.new }.to raise_error "Airport is full!"
    end
  end

  describe "taking-off plane tests" do
    it { is_expected.to respond_to(:take_off) }
  end

  it "returns the take-off plane" do
    plane = FakePlane.new
    subject.land(plane)                            # we need to state that a plane has landed for it to take-off.
    expect(subject.take_off).to eq plane           # Subject(Airport.new) will be empty without a plane
  end

  it "raises and error attempting to take_off a plane that does not exist " do
    expect {subject.take_off}.to raise_error "no planes available for take-off!"
  end

end

# use attr_reader to create the capacity method and use initialize to set its initial value

# edge cases - the same plane cannot take_off twice
#            - the same plane cannot land twice
