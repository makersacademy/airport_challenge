require 'airport'
require 'airplane'

describe 'airport' do
  let(:airport) {Air_Port.new}
  #let(:airport2) {Air_Port.new} #for varied Capacity (is this necessary?)
  let(:airplane) {Air_Plane.new}

  context 'Allows airport to interact with primary functions' do
    it 'lands a plane (one by one - no restrictions)' do
      expect(airport).to respond_to(:land_plane).with(1).argument
    end
    it 'responds to present plane' do
      expect(airport).to respond_to(:present_plane?)
    end
    it 'instructs take off' do
      expect(airport).to respond_to(:instruct_take_off).with(1).argument
    end
  end
  context 'Airport capacity:' do
    it "has default capacity" do
      expect(airport.capacity).to eq(Air_Port::DEFAULT_CAPACITY)
    end
    it "responds to set_capacity method" do
      expect(airport).to respond_to(:set_capacity)
    end
  #  it "has a variable capacity" do
      #expect(airport.set_capacity).to be(input_capacity)#I suppose you can change it to gets chomp. airport2?
  #    airport.set_capacity
  #    expect(input_capacity).to eq(capacity)
  #  end
  end

  context 'landing planes:' do
    it "pushes planes into the capacity" do
      expect(airport.land_plane(airplane)).to eq([airplane])
    end
    it "shows landed planes" do
      airport.land_plane(airplane)
      expect(airport.airplanes).to eq([airplane])
    end
    it 'does not land beyond capacity (default or varied)' do
      expect{(airport.capacity+1).times{airport.land_plane(airplane)}}.to raise_error("Full Capacity reached, no landing!")
    end
    it 'confirms plane presence' do
      #expect{airport.present_plan}.to raise_error("Plane has not landed")
      expect(airport.present_plane?(airplane)).to eq false
      airport.land_plane(airplane)
      expect(airport.present_plane?(airplane)).to eq true
    end
  end

  context 'planes taking off' do
    it 'recognises a plane has takenoff' do
      airport.land_plane(airplane)
      airport.instruct_take_off(airplane)
      expect(present_plane?(airplane)).to eq []
    end
  end
end
