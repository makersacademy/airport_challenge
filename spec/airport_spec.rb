require 'airport'
require 'plane'


describe Airport do

  let(:plane) {double('a plane', flying?: true)}

  describe '#initialize' do
    it "should allow a user to set the capacity" do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end

    it "should have a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  it 'allows planes to land' do
    allow(plane).to receive(:land).and_return(flying?: false)
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'allows planes to take-off' do
    allow(plane).to receive(:land).and_return(flying?: false)
    allow(plane).to receive(:fly).and_return(flying?: true)
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to eq []
  end

  it 'will not allow planes to land if it is full' do
    40.times {subject.land(Plane.new)}
    expect { subject.land(plane) }.to raise_error
    "Please enter holding pattern, we are at full capacity"
  end

  it 'will not allow planes it doesn\'t have to take off' do
    expect { subject.take_off(plane) }.to raise_error
    "That plane is not at this airport"
  end

  it 'will not allow take-off or landing of planes during stormy weather' do

  end

end
