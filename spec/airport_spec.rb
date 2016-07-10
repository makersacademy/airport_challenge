require 'airport.rb'

describe Airport do

  let (:plane) { double :plane }

  context 'responds to' do
    it { is_expected.to respond_to :land_plane }
    it { is_expected.to respond_to :take_off_plane }
  end

  context '#land_plane when weather is clear' do

    before :example do
      srand(16) #weather will randomly generate stormy == false whith this seed
    end

    it 'must accept a Plane object as an argument' do
      expect(subject).to respond_to(:land_plane).with(1).arguments
    end

    it 'should confirm the plane has landed' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:flying).and_return(true)
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it 'should return an error if the plane is already landed' do
      allow(plane).to receive(:flying).and_return(false)
      expect {subject.land_plane(plane)}.to raise_error "Plane is not flying"
    end

    it 'should return an error if the hanger is full' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:flying).and_return(true)
      Airport::DEFAULT_CAPACITY.times { srand(16); subject.land_plane(plane) }
      expect {subject.land_plane(plane)}.to raise_error "Hanger is full"
    end
  end

  context '#land_plane when weather is stormy' do

    before :example do
      srand(50) # weather will randomly generate stormy == true with this seed
    end

    it 'should return an error if the weather is stormy' do
      allow(plane).to receive(:take_off)
      allow(plane).to receive(:flying).and_return(true)
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
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(plane).to receive(:flying).and_return(true)
      subject.land_plane(plane)
      allow(plane).to receive(:flying).and_return(false)
      expect(subject.take_off_plane(plane)).to eq plane
    end

    it 'should return an error if the plane is already flying' do
      allow(plane).to receive(:flying).and_return(true)
      expect {subject.take_off_plane(plane)}.to raise_error "Plane is flying"
    end

    it 'should return an error if the plane is not located in the airport hanger' do
      allow(plane).to receive(:flying).and_return(false)
      expect {subject.take_off_plane(plane)}.to raise_error "Plane is not located at this airport"
    end

    it 'should remove the plane from the hanger' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(plane).to receive(:flying).and_return(true)
      subject.land_plane(plane)
      allow(plane).to receive(:flying).and_return(false)
      subject.take_off_plane(plane)
      expect {subject.take_off_plane(plane)}.to raise_error "Plane is not located at this airport"
    end
  end

  context '#take_off_plane when weather is stormy' do

    before :example do
      srand(11) # weather will randomly generate clear to land, then stormy to take off
    end

    it 'should return an error if the weather is stormy' do
      allow(plane).to receive(:land)
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:take_off)
      allow(plane).to receive(:flying).and_return(true)
      subject.land_plane(plane)
      allow(plane).to receive(:flying).and_return(false)
      expect {subject.take_off_plane(plane)}.to raise_error "Weather is stormy"
    end
  end
end
