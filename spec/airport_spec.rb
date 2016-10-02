require 'airport'

describe Airport do
  subject(:airport) {Airport.new}

  let (:weather) {Weather.new}
  let (:plane) {Plane.new}


  context 'landing planes' do
     it 'Should not allow planes to land if capacity is at max' do
       5.times{airport.land(Plane.new)}
       expect{airport.land(Plane.new).to raise_error("Airport is full")}
     end

      it 'Should be able to change capacity of airport' do
        airport2 = Airport.new(20)
        20.times{airport2.land(Plane.new)}
        expect{airport2.land(Plane.new)}.to raise_error("Airport is full")
      end

     it 'should allows method land' do
       expect(airport).to respond_to :land
       expect(airport.land(plane)).to eq([plane])
     end

     it "shouldn't land plane if it is already landed" do
       airport.land(plane)
       expect{airport.land(plane)}.to raise_error("Plane already landed")
     end

      # context 'when stormy'
      #   it 'Should not allow planes to land if weather is stormy' do
      #     allow(weather).to receive(:Stormy) {true}
      #     expect{airport.land(plane)}.to raise_error("Can't land plane :( ")
      #   end
      # end

   end

  context 'taking off' do

    before (:each) do
      airport.land(plane)
      #allow(@weather).to receive(:stormy?) {:sunny}
    end

    it 'Should be able to take off specific plane' do
      planey = Plane.new
      airport.land(planey)
      expect(airport.take_off(planey)).to eq(planey)
    end

    it "shouldn't allow plane to take off if it is not in airport" do
      planey = Plane.new
      expect{airport.take_off(planey)}.to raise_error("Plane not in this airport")
    end

    it "should raid raise error if plane has already taken off" do
      airport.take_off(plane)
      expect{airport.take_off(plane)}.to raise_error("Plane already in flight")
    end

    # context 'taking off when stormy'
    #   it "Shouldnt take off if stormy = true" do
    #     allow(@weather).to receive(:stormy?) {:stormy}
    #     expect{airport.take_off}.to raise_error("Can't take off :(")
    #   end
    # end
  end


 end
