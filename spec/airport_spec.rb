require 'airport'

describe Airport do

  describe '#land' do

    it {is_expected.to respond_to(:land).with(1).argument}

    it "lands plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

  end

  describe '#take_off' do

    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'instructs plane to take off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq plane
    end

  end

end
