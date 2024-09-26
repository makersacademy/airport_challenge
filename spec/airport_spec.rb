require 'airport'
describe Airport do 
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  
  it "can create an instance of itself" do
    expect(subject).to be_an_instance_of(Airport)
  end
  
  it { is_expected.to respond_to(:take_off).with(1).argument }

  # it "returns a confirmation when a plane has taken off" do
  #   subject.land(plane)
  #   expect(subject.take_off(plane)).not_to include(plane)
  # end

  before do
    allow(airport).to receive(:stormy?).and_return false
  end

  it "raises an error when landing a plane and airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Airport is Full"
  end
  
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "can store the landed plane in the airport" do
      # plane = Plane.new
      # plane = subject.land(plane)
      expect(subject.land(plane)).to eq [plane]
    end

    it "raises and error when landing a plane and its stormy" do
      allow(airport).to receive(:stormy?).and_return true 
      expect { airport.land(plane) }.to raise_error "Cannot land plane as weather is stormy "
    end
  end
  
  describe "#initilize" do
    it "will initilize with a default capacity of 5" do
      # allow(airport).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end 

    it "will initilize with the capacity specified" do
      subject = Airport.new(6)
      expect(subject.capacity).to eq 6
    end
  end

end
