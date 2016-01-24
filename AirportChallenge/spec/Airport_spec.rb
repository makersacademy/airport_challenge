require "airport"
require "airplane"

describe "airport" do

  before(:example) do
    @airport = Airport.new("luton")
  end
  before(:example) do
    @airplane = Airplane.new
  end

  describe 'instances of airport' do
    it "can create instance of airport" do
      expect(@airport.name).to start_with("l") & end_with("n")
    end

    it "name = arg" do
      expect(@airport.name).to eq "luton"
    end
  end

  describe 'capacity' do
    it "can set capacity when set_capacity is called" do
      expect(@airport.assign_capacity(100)).to eq(100)
    end
  end

  describe 'land/takeoff' do
    it "plane can land" do
      allow(@airport).to receive(:stormy?) {false}
      allow(@airport).to receive(:security_threat?) {false}
      @airport.tell_to_land(@airplane)
      expect(@airport.planes_at_airport).to include(@airplane)
    end

    it "plane can take off" do
      @airport.tell_to_take_off(@airplane)
      expect(@airport.planes_at_airport).to eq []
    end
  end

  describe 'tell to land when full' do
    it "cant land when full is true" do
      allow(@airport).to receive (:full?) {true}
      expect(@airport.tell_to_land(@airplane)).to eq "luton is full/dangerous or its too stormy, no land bro"
    end

    it 'is full when cap reached' do
      20.times{@airport.tell_to_land(Airplane.new)}
      expect(@airport.tell_to_land(@airplane)).to eq  "luton is full/dangerous or its too stormy, no land bro"
    end
  end

  describe 'stormy issues' do
    it 'does not allow plane to take off in stormy weather' do
      allow(@airport).to receive(:stormy?) {true}
      @airport.tell_to_land(@airplane)
      expect(@airport.tell_to_take_off(@airplane)).to eq "too stormy to fly bro"
    end

    it 'doesn\'t allow plane to land in stormz' do
      allow(@airport).to receive(:stormy?) {true}
      expect(@airport.tell_to_land(@airplane)).to eq "#{@airport.name} is full/dangerous or its too stormy, no land bro"
    end
  end
end



# test each method, and change of state in object
