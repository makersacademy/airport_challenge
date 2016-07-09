require 'airport.rb'

describe Airport do

  let (:plane) { double :plane }
  let (:weather) {double :weather }

  context 'responds to' do
    it { is_expected.to respond_to :land_plane }
    it { is_expected.to respond_to :take_off_plane }
  end

  context '#land_plane' do
    it 'must accept a Plane object as an argument' do
      expect(subject).to respond_to(:land_plane).with(1).arguments
    end

    it 'should confirm the plane has landed' do
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it 'should return an error if the hanger is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
      expect {subject.land_plane(plane)}.to raise_error
    end

    it 'should return an error is the weather is stormy' do
      allow(weather).to receive(:stormy).and_return(true)
      expect {subject.land_plane(plane)}.to raise_error
    end
  end

  context '#take_off_plane' do
    it 'should accept a Plane object as an argument' do
      expect(subject).to respond_to(:take_off_plane).with(1).argument
    end

    it 'should confirm the plane is flying' do
      expect(subject.take_off_plane(plane)).to eq true
    end

  end


end
