require 'airport'

describe Airport do
  
  describe "#land" do
    
    it 'responds to the method land and lands a plane in the airport' do
      plane = Plane.new
      expect(subject).to respond_to :land
      expect(subject.land(plane)).to_not be_empty
    end

    it "raises an error when airport is full" do
      20.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error "Airport is full"
    end

  end

  describe "#plane" do
    it 'returns planes in the airport' do
      subject.land Plane.new
      expect(subject.planes).to_not be_empty
    end
  end

  describe "#take_off" do
    
    it 'responds to the method take_off and removes plane from the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject).to respond_to :take_off
      expect(subject.take_off).to eq plane
    end

    it "raises an error if there are no planes in the airport" do
      plane = Plane.new
      expect { subject.take_off }.to raise_error "No planes available"
    end
  end

end
