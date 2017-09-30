require 'airport'

describe Airport do
  describe "landing plane tests" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "returns the landed plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
    it 'raises an error when airport is full' do
      10.times {subject.land(Plane.new)}
      expect {subject.land Plane.new }.to raise_error "Airport is full!"
    end
  end

  describe "taking-off plane tests" do
    it { is_expected.to respond_to(:take_off) }
  end

  it "returns the take-off plane" do
    plane = Plane.new
    subject.land(plane)                            # we need to state that a plane has landed for it to take-off.
    expect(subject.take_off).to eq plane           # Subject(Airport.new) will be empty without a plane
  end

  it "raises and error attempting to take_off a plane that does not exist " do
    expect {subject.take_off}.to raise_error "no planes available for take-off!"
  end

end
