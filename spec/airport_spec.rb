require 'airport'

describe Airport do

  let(:plane) {double :plane}
  let(:plane2) {double :plane2}

  describe '#land' do

    it {is_expected.to respond_to(:land).with(1).argument}

    it 'lands plane' do
      plane = double(:plane, :ground => false)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'prevents landing when weather is stormy'

    it 'prevents landing when airport is full'

    it 'planes cannot land if they are already at the airport'

    it 'planes cannot land if they have landed at another airport'

  end

  describe '#take_off' do

    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'planes instructed to take off and leaves airport' do
      plane = double(:plane, :ground => false, :fly => true)
      plane2 = double(:plane2, :ground => false)
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.planes).to eq [plane2]
    end

    it 'planes cannot take off when weather is stormy'

    it 'planes can only take off if they are landed'

    it 'planes can only take off from aiport they are in'

  end

  it 'sets default airport capacity'
  it 'allows default airport capacity to be overridden'

end
