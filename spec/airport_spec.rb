require 'airport'
describe Airport do

  describe '#initialize' do

    it 'creates an array' do
      expect(subject.planes).to eq []
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to :take_off}

    it 'gets a plane and the plane has passengers' do
      subject.land(Plane.new)
      plane =subject.take_off
      expect(plane).to be_passengers
    end

    it 'raise an exception if no plane is available to release' do
      expect{ subject.take_off }.to raise_error("No planes available")
      end

      describe '#land' do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'shows that the plane has landed' do
      plane = Plane.new
      expect(subject.land(plane)).to include plane
    end

    it 'raise an exception if the airport id full' do
      Airport::DEFAULT_CAPACITY.times { subject.land Plane.new }
      expect{ subject.land(Plane.new) }.to raise_error("Airport full")
    end


        it 'show a plane has landed' do
          my_plane = Plane.new
          subject.land(my_plane)
          expect(subject.planes).to include my_plane
        end


  end

  end
  end
