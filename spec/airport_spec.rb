require 'airport'

describe Airport do
  subject(:airport) {Airport.new(5 , weather)}

  let (:weather) {Weather.new}
  let (:plane) {Plane.new}


  context 'landing planes' do
     it 'Should not allow planes to land if capacity is at max' do
       5.times{airport.land(Plane.new)}
       expect{airport.land(Plane.new).to raise_error("Airport is full")}
     end

     it 'should allows method land' do
       expect(airport).to respond_to :land
       expect(airport.land(plane)).to eq([plane])
     end

      # context 'when stormy'
      #   it 'Should not allow planes to land if weather is stormy' do
      #     allow(weather).to receive(:Stormy) {true}
      #     expect{airport.land(plane)}.to raise_error("Can't land plane :( ")
      #   end
      # end

   end

  context 'taking off' do

  it 'Should be able to take off' do
    airport.land(plane)
    planey = Plane.new
    airport.land(planey)
    expect(airport.take_off(planey)).to eq(planey)
  end

    # context 'taking off when stormy'
    #   it "Shouldnt take off if stormy = true" do
    #     allow(@weather).to receive(:stormy?) {:sunny}
    #     airport.land(@plane)
    #     allow(@weather).to receive(:stormy?) {:stormy}
    #     expect{airport.take_off}.to raise_error("Can't take off :(")
    #   end
    # end
  end


 end
