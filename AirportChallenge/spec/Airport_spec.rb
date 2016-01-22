require "Airport"
require "Airplane"

describe "Airport" do

  before(:example) do
    @airport = Airport.new("luton")
  end

  it "can create instance of airport" do
    expect(@airport.name).to start_with("l") & end_with("n")
  end

  it "name = arg" do
    expect(@airport.name).to eq "luton"
  end

  it "can set capacity when set_capacity is called" do
    expect(@airport.set_capacity(100)).to eq(100)
  end

  it "plane can land" do
    airplane = Airplane.new('1')
    allow(@airport).to receive(:stormz) {false}
    @airport.tell_to_land(airplane)
    expect(@airport.planes_at_airport).to include(airplane)
  end

  it "plane can take off" do
    airplane = Airplane.new('1')
    @airport.tell_to_take_off(airplane)
    expect(@airport.planes_at_airport).to eq([])
  end

  it "airport_capacity and cap_used are equal, should return true" do
    @airport.set_used_capacity(10)
    expect(@airport.full).to eq true
  end

  it 'stormy is true or false' do
    expect(@airport.stormy).to eq(true) | eq(false)
  end

  it 'does not allow plane to take off in stormy weather' do
    airplane = Airplane.new('1')
    allow(@airport).to receive(:stormz) {true}
    @airport.tell_to_land(airplane)
    expect(@airport.tell_to_take_off(airplane)).to eq "too stormy to fly bro"
  end

  it 'doesn\'t allow plane to land in stormz' do
    allow(@airport).to receive(:stormz) {true}
    airplane = Airplane.new('1')
    expect(@airport.tell_to_land(airplane)).to eq "#{@airport.name} is full or its too stormy, no land bro"
  end
end



# test each method, and change of state in object
