require 'plane'

describe Plane do
    it 'makes airplanes' do
        plane = Plane.new
    end

    it { is_expected.to respond_to :land }

    it { is_expected.to respond_to :take_off}

#    it { is_expected.to respond_to :weather}
end
