require 'airport'
require 'plane'

describe Airport do

  describe '#land' do

    #let(:plane) { double :plane }

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error when weather is stormy' do
      #to fix: will currently only work when whether is randomly stormy
      expect { subject.land(double(plane)) }.to raise_error "Can't land when stormy"
    end

    it 'raises an error when airport is full' do
      Airport::DEFAULT_CAPACITY.times do
        plane = Plane.new
        plane.on_ground = false
        subject.land(plane)
      end
      expect {
        plane = Plane.new
        plane.on_ground = false
        subject.land(plane) }.to raise_error "Airport full"
    end

  end

  describe '#takeoff' do

    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'raises an error when weather is stormy' do
      #to fix: will currently only work when whether is randomly stormy
      expect { subject.takeoff(Plane.new) }.to raise_error "Can't take off when stormy"
    end
  end



end
