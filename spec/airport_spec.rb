require 'airport'

describe Airport do

  describe 'land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error when weather is stormy' do
      #to fix: will currently only work when whether is randomly stormy
      expect { subject.land(Plane.new) }.to raise_error "Can't land when stormy"
    end
  end

  describe 'takeoff' do

    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'raises an error when weather is stormy' do
      #to fix: will currently only work when whether is randomly stormy
      expect { subject.takeoff(Plane.new) }.to raise_error "Can't take off when stormy"
    end
  end



end
