require 'airport'

describe Airport do

  # ensure class responds to take off and land methods
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :land }

  describe 'capacity' do

    context 'without parameters' do
      it "should use the default capacity of 20" do
        expect(subject.capacity).to eq(20)
      end
    end

    context 'with parameters' do
      let(:airport) { Airport.new(45)}
      it "should allow the airport capacity to be overridden when necessary" do
        expect(airport.capacity).to eq(45)
      end
      it "should raise an error when the new capacity is exceeded" do
        airport.capacity.times { airport.land(Plane.new) }
        expect { airport.land(Plane.new) }.to raise_error("Airport is full")
      end
      it "test the capacity can be changed multiple times" do
        airport.capacity = 37
        expect(airport.capacity).to eq(37)
      end
    end
  end


  describe '#take_off' do

    before :each do
      @plane = Plane.new
      subject.land(@plane)
    end

    it 'checks that taken off planes are no longer in airport' do
      #we want the same plane that landed to take off again
      subject.take_off(@plane)
      expect(subject.planes).to_not eq [@plane]
    end

    it 'checks that #take_off adds in_flight status to planes which have taken off' do
      subject.take_off(@plane)
      expect(@plane).to have_attributes(:in_flight => true)
    end
  end


  describe '#land' do

    before :each do
      @plane = Plane.new
      subject.land(@plane)
    end

    it 'allows planes to land in airport' do
      #tests that the airport stores the landed plane
      expect(subject.planes).to eq [@plane]
    end

    it 'adds in_airport status to planes which have landed' do
      expect(@plane).to have_attributes(:in_flight => false)
    end

  end


  describe "guard conditions" do
    it 'raises an error when there are no planes available to take off' do
      expect { subject.take_off(Plane.new) }.to raise_error "Airport is empty"
    end

    it 'raises an error when a plane lands at a full airport' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'raises an error when it is too stormy to take off' do
      # ensure airport is not empty
      plane = Plane.new
      subject.land(plane)
      # ensure weather is stormy
      allow_any_instance_of(Weather).to receive(:randomize) { true }
      expect { subject.take_off(Plane.new) }.to raise_error("Too stormy for take off")
    end

    it 'raises an error when it is too stormy to land' do
      # ensure weather is stormy
      allow_any_instance_of(Weather).to receive(:randomize) { true }
      expect { subject.land(Plane.new) }.to raise_error("Too stormy for landing")
    end

    it 'raises an error when if a plane tries to land that is already in airport' do
      # lands plane
      plane = Plane.new
      subject.land(plane)
      # attempts to land same plane
      expect { subject.land(plane) }.to raise_error("Plane already landed")
    end

    it 'raises an error when if a plane tries to take off that is already in flight' do
      # ensure 'airport empty' exception is not raised
      allow(subject).to receive(:airport_empty?) {false}
      # takes off plane
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      # takes off same plane
      expect { subject.take_off(plane) }.to raise_error("Plane is already flying")
    end

  end

  describe 'confirmation messages' do

    xit 'confirms that a plane has taken off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq("Take off successful.")
    end
    xit 'confirms that a plane has landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq("Landing successful.")
    end
  end

end
