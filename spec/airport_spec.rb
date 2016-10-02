require 'airport'

describe Airport do
  subject(:airport) {Airport.new}

  before(:each) do
    @plane = Plane.new
  end

  context 'landing planes' do
     it 'Should not allow planes to land if capacity is at max' do
       5.times{airport.land(Plane.new)}
       expect{airport.land(Plane.new).to raise_error("Airport is full")}
     end
     # it 'Should not allow planes to land if weather is stormy' do
     #   allow(@weather.stormy?).to eq(:true)
     #   expect{airport.land(@plane)}.to raise_error("Can't land plane :( ")
     # end
     # it 'should allows method land' do
     #   expect(airport).to respond_to :land
     #   expect(airport.land(@plane)).to eq([@plane])
     # end
   end

  context 'taking off' do

  # it 'Should be able to take off' do
  #   airport.land(@plane)
  #   expect(airport.take_off).to eq(@plane)
  # end
    it "Shouldnt take off if stormy = true" do
      airport.land(@plane)
      expect{airport.take_off}.to raise_error("Can't take off :(")
    end
  end

  # it 'test stormy is set to true' do
  #     @weather = Weather.new
  #     (@weather.stormy?).to eq(true)
  #     expect(@weather.stormy?).to eq(true)
  # end


end
