require 'airport'

describe Airport do

  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :land }

  describe "capacity" do
      context "without parameters" do
        it "should use the default capacity of 20" do
          expect(subject.capacity).to eq(20)
        end
      end
      context "with parameters" do
        let(:airport) { Airport.new(45)}
        it "should allow the airport capacity to be overridden when necessary" do
          expect(airport.capacity).to eq(45)
        end
      end
  end

  it 'allows planes to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'shows landed planes' do
    plane = Plane.new
    subject.land(plane)
    #tests that the airport stores the landed plane
    expect(subject.planes).to eq [plane]
  end

  describe '#take_off' do

    it 'allows a landed plane to take off' do
      plane = Plane.new
      subject.land(plane)
      #we want the same plane that landed to take off again
      expect(subject.take_off).to eq plane
    end

    it 'raises an error when there are no planes available to take off' do
      expect { subject.take_off }.to raise_error "Airport is empty"
    end

  end

  describe '#land' do
    # it 'raises an error when a plane lands at a full airport' do
    #   subject.land(Plane.new)
    #   expect { subject.land(Plane.new) }.to raise_error("Airport is full")
    # end

    it 'raises an error when a plane lands at an airport with capacity of 20 planes' do
      Airport::MAX_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport is full")
    end

  end
end
