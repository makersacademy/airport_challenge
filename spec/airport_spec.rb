require 'airport.rb'

describe Airport do

  let (:plane) { double :plane }
  let (:weather) {double :weather }

  context 'responds to' do
    it { is_expected.to respond_to :land_plane }
    it { is_expected.to respond_to :take_off_plane }
  end

  context '#land_plane when weather is clear' do

    before :example do
      srand(16)
    end

    it 'must accept a Plane object as an argument' do
      expect(subject).to respond_to(:land_plane).with(1).arguments
    end

    it 'should confirm the plane has landed' do
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it 'should return an error if the hanger is full' do
      Airport::DEFAULT_CAPACITY.times { srand(16); subject.land_plane(plane) }
      expect {subject.land_plane(plane)}.to raise_error "Hanger is full"
    end
  end

  context '#land_plane when weather is stormy' do

    before :example do
      srand(50)
    end

    it 'should return an error' do
      expect {subject.land_plane(plane)}.to raise_error "Weather is stormy"
    end
  end

  context '#take_off_plane when weather is clear' do

    before :example do
      srand(16)
    end

    it 'should accept a Plane object as an argument' do
      expect(subject).to respond_to(:take_off_plane).with(1).argument
    end

    it 'should confirm the plane has left the airport' do
      subject.land_plane(plane)
      expect(subject.take_off_plane(plane)).to eq plane
    end
  end

  context '#take_off_plane when weather is stormy' do

    before :example do
      srand(50)
    end

    it 'should return an error if the weather is stormy' do
      expect {airport.take_off_plane(plane)}.to raise_error
    end
  end
end
