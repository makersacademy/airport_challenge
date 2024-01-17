require 'airport'

describe Airport do
  
  describe '#land' do

    it 'prevents plane landing when airport is at capacity' do
      heathrow = Airport.new
      ba = Plane.new
      allow(heathrow).to receive(:weather).and_return('sunny')
      20.times do
        heathrow.land(ba)
      end
      expect(heathrow.land(ba)).to eq("Please wait we are at max capacity")
    end

    it 'prevents plane landing when weather is stormy' do
      heathrow = Airport.new
      ba = Plane.new
      allow(heathrow).to receive(:weather).and_return('stormy')
      expect(heathrow.land(ba)).to eq('You may not land as weather is stormy')
    end

    # it 'checks if the plane has already landed' do
    #   heathrow = Airport.new
    #   ba = Plane.new
    #   allow(heathrow).to receive(:weather).and_return('sunny')
    #   expect(heathrow.land(ba)).to eq("This plane has already landed")
    # end

    it 'commands a plane to land' do
      heathrow = Airport.new
      ba = Plane.new
      heathrow.land(ba)
      allow(heathrow).to receive(:weather).and_return('sunny')
      expect(heathrow).to respond_to(:land).with(1).argument
    end

  end

  describe '#take_off' do
    it 'commands a plane to take off' do
      heathrow = Airport.new
      ba = Plane.new
      heathrow.take_off(ba)
      allow(heathrow).to receive(:weather).and_return('sunny')
      expect(heathrow).to respond_to(:take_off).with(1).argument
    end

    it 'tells a plane they cannot take off because of stormy weather' do
      heathrow = Airport.new
      ba = Plane.new
      allow(heathrow).to receive(:weather).and_return('stormy')
      expect(heathrow.take_off(ba)).to eq('You may not take off, the weather is too stormy')
    end

    it 'checks if the plane is at the current airport' do
      heathrow = Airport.new
      ba = Plane.new
      allow(heathrow).to receive(:weather).and_return('sunny')
      expect(heathrow.take_off(ba)).to eq("This plane is not parked at this airport")
    end
  end
end
