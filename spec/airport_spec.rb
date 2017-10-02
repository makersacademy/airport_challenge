require 'airport'
require 'weather'


describe Airport do

  describe '#land_at_airport' do
    it 'allows a plane to be landed in normal conditions' do
      plane = Plane.new
      # weather = double(:weather)
      # allow(weather).to receive(:stormy).and_return false
      expect(subject.land_at_airport(plane)).to eq plane
    end
    # it 'does not allow a plan to land if it is stormy' do
    #   plane = Plane.new
    #   weather = double(:weather)
    #   allow(weather).to receive(:stormy).and_return true
    #   expect { subject.take_off(plane) }.to raise_error "Too stormy!"
    # end
  end

  describe '#take_off' do
    it 'allows a plane to take off in normal conditions' do
      plane = Plane.new
      # weather = double(:weather)
      # allow(weather).to receive(:stormy).and_return false
      expect(subject.take_off(plane)).to eq plane
    end
    # it 'prevents take off if weather is stormy' do
    #   plane = Plane.new
    #   weather = double(:weather)
    #   allow(weather).to receive(:stormy).and_return true
    #   expect { subject.take_off(plane) }.to raise_error "Too stormy!"
    # end

    it 'keeps track of taken off planes to confirm they are gone' do
      plane = Plane.new
      # weather = double(:weather)
      # allow(weather).to receive(:stormy).and_return false
      subject.take_off(plane)
      expect(subject.plane).to eq plane
    end
  end


end
