require 'airport'


describe Airport do
  it { is_expected.to be_a Airport}
  it { is_expected.to respond_to(:takeoff) }
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'returns error when hangar is empty' do
    expect{subject.takeoff}.to raise_error("No planes are available to fly(?!)")
  end

  it "returns error when the hangar is full" do
    ::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect{ subject.land(Plane.new) }.to raise_error("This airport's hangar is full.")
  end

  it "when @capacity is equal to 20" do
    a = Airport.new
    expect(a.capacity).to eq 20
  end

  it "sets capacity to a specified number" do
    a = Airport.new(30)
    expect(a.capacity).to eq 30
  end

  it 'expects hangar to keep plane' do
    subject.land(Plane.new)
    expect(subject.hangar).not_to be_nil
  end
end
