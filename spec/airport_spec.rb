require './lib/airport'

describe Airport do

  it "is created with a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to be_an(Integer)
  end

  it "can be created with a custom capacity" do
    custom_capacity = rand(1..20)
    airport = Airport.new(custom_capacity)
    expect(airport.capacity).to eq custom_capacity
  end

  it "reports what is in the hangar when asked" do
    airport = Airport.new
    expect(airport.hangar).to eq airport.hangar
  end

  it "can be full" do
    airport = Airport.new
    airport.capacity.times { Plane.new.land(airport) }
    expect(airport.full?).to be true
  end

  it "can be not full" do
    airport = Airport.new
    if airport.hangar.length < airport.capacity
      expect(airport.full?).to be false
    end
  end

  it "capacity can be overriden" do
    airport = Airport.new
    custom_capacity = rand(1..20)
    airport.change_capacity(custom_capacity)
    expect(airport.capacity).to eq custom_capacity
  end

  it { is_expected.to respond_to(:stormy?) }

end
