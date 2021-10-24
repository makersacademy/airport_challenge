require './lib/airport'
describe Airport do
    it {is_expected.to respond_to(:plane)}
    it {is_expected.to respond_to(:land)}
    it {is_expected.to respond_to(:takeOff)}

    it 'lands a plane' do
        heathrow = Airport.new(20, 10) #these parameters set capacity and weather (optional)
        plane = Plane.new
        expect(heathrow.land(plane)).to eq ([plane])
    end

    it 'lets a plain take off and confirms no longer in airport' do
        heathrow = Airport.new(20, 10)
        plane = Plane.new
        expect(heathrow.land(plane)).to eq ([plane])
        expect(heathrow.takeOff(plane)).to eq (plane)
        expect(heathrow.hanger).not_to include(plane)
    end

    it 'prevents landing when airport full' do
        heathrow = Airport.new(20,10)
        20.times {heathrow.land(Plane.new)}
        expect{heathrow.land(Plane.new)}.to raise_error(StandardError)
        
    end

    it "prevents landing when weather = stromy" do
        heathrow = Airport.new(20,1)
        expect{heathrow.land(Plane.new)}.to raise_error(StandardError)
    end
        
    it 'prevents plane taking off when weather is stormy' do
      heathrow = Airport.new(20,1)
      plane = Plane.new
      expect{heathrow.takeOff(plane)}.to raise_error(StandardError)
    end

    # it 'prevents a landed plane landing again' do
    #     heathrow = Airport.new(20,9)
    #     plane = (Plane.new)
    #     heathrow.land(plane)
    #     heathrow.land(plane)
    # end

end
