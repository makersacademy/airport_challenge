require "system"

describe System::SystemControl do

  it "should output 'You can land' if all the condition of sunny? weather, flying? state and landing_possibility? of the destination's airport are fulfiled" do
    origin_marseille = Airport.new("Marignane", 100, 95)
    destination_london = Airport.new("Stansted", 200, 150)
    plane_1 = Plane.new("flying")
    systemcontrol = described_class.new(origin_marseille, destination_london, plane_1)
    allow_any_instance_of(Weather).to receive(:forecast).and_return(Weather::SUNNY)
    expect(systemcontrol.land).to eq "You can land"
  end

  it "should output 'You cannot land' if the condition of sunny? of the destination's airport is not fulfiled" do
    origin_marseille = Airport.new("Marignane", 100, 95)
    destination_london = Airport.new("Stansted", 200, 150)
    plane_1 = Plane.new("flying")
    systemcontrol = described_class.new(origin_marseille, destination_london, plane_1)
    allow_any_instance_of(Weather).to receive(:forecast).and_return(Weather::STORMY)
    expect(systemcontrol.land).to eq "You cannot land"
  end

  it "should output 'You cannot land' if the condition of flying? of plane is not fulfiled" do
    origin_marseille = Airport.new("Marignane", 100, 95)
    destination_london = Airport.new("Stansted", 200, 150)
    plane_1 = Plane.new("landed")
    systemcontrol = described_class.new(origin_marseille, destination_london, plane_1)
    allow_any_instance_of(Weather).to receive(:forecast).and_return(Weather::SUNNY)
    expect(systemcontrol.land).to eq "You cannot land"
  end

  it "should output 'You cannot land' if the condition of landing_possibility of the destination's airport is not fulfiled" do
    origin_marseille = Airport.new("Marignane", 100, 95)
    destination_london = Airport.new("Stansted", 200, 200)
    plane_1 = Plane.new("flying")
    systemcontrol = described_class.new(origin_marseille, destination_london, plane_1)
    allow_any_instance_of(Weather).to receive(:forecast).and_return(Weather::SUNNY)
    expect(systemcontrol.land).to eq "You cannot land"
  end

  it "should output 'You can take_off' if all the condition of sunny? weather, landed? state and origin's airport different from destination's airport are fulfiled" do
    origin_marseille = Airport.new("Marignane", 100, 95)
    destination_london = Airport.new("Stansted", 200, 150)
    plane_1 = Plane.new("landed")
    systemcontrol = described_class.new(origin_marseille, destination_london, plane_1)
    allow_any_instance_of(Weather).to receive(:forecast).and_return(Weather::SUNNY)
    expect(systemcontrol.take_off).to eq "You can take_off"
  end

  it "should output 'You cannot take_off' if the condition of sunny? weather of the origin's airport is not fulfiled" do
    origin_marseille = Airport.new("Marignane", 100, 95)
    destination_london = Airport.new("Stansted", 200, 150)
    plane_1 = Plane.new("landed")
    systemcontrol = described_class.new(origin_marseille, destination_london, plane_1)
    allow_any_instance_of(Weather).to receive(:forecast).and_return(Weather::STORMY)
    expect(systemcontrol.take_off).to eq "You cannot take_off"
  end

  it "should output 'You cannot take_off' if the condition of landed? of the plane is not fulfiled" do
    origin_marseille = Airport.new("Marignane", 100, 95)
    destination_london = Airport.new("Stansted", 200, 150)
    plane_1 = Plane.new("flying")
    systemcontrol = described_class.new(origin_marseille, destination_london, plane_1)
    allow_any_instance_of(Weather).to receive(:forecast).and_return(Weather::SUNNY)
    expect(systemcontrol.take_off).to eq "You cannot take_off"
  end

  it "should output 'You cannot take_off' if the condition of landed? of origin's airport different from destination's airport is not fulfiled" do
    origin_marseille = Airport.new("Marignane", 100, 95)
    destination_marseille = Airport.new("Marignane", 100, 95)
    plane_1 = Plane.new("landed")
    systemcontrol = described_class.new(origin_marseille, destination_marseille, plane_1)
    allow_any_instance_of(Weather).to receive(:forecast).and_return(Weather::SUNNY)
    expect(systemcontrol.take_off).to eq "You cannot take_off"
  end

end
