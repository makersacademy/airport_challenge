require 'airport'
require 'weather'

describe Airport do

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'logs one plane has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to include plane
    end

    it 'logs a second plane has landed' do
      plane = Plane.new
      plane2 = Plane.new
      subject.land(plane)
      subject.land(plane2)
      expect(subject.hangar).to include plane2

    end

  end

  describe '#take_off' do

    it { is_expected.to respond_to :take_off }

    it 'confirms a plane is no longer in the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(subject.hangar).not_to include plane
    end

  end

  describe '#weather' do

    it { is_expected.to respond_to :weather }

    it "can return 'Clear' or 'Stormy'" do
      expect(subject.weather).to eq('Clear').or eq('Stormy')
    end

  end

end
