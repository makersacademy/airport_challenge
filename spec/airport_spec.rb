require 'airport'

describe Airport do
  let(:heathrow) { Airport.new }
  let(:bertie) { Plane.new('bertie') }
  let(:weather) { instance_double("Weather", weather_report: 'sunny') }

  before do
    allow(Weather).to receive(:new).and_return(weather)
  end

  it "allows a plane to land at an airport" do
    heathrow.land(bertie)
    expect(heathrow.apron).to eq(['bertie'])
  end

  it "allows a plane to take off" do
    heathrow.land(bertie)
    expect(heathrow.take_off(bertie)).to eq("bertie has taken off!")
  end

  it "can check if there are planes at the airport" do
    expect(heathrow.planes_at_airport.kind_of?(Array)).to eq(true)
  end

  it "has a record of a plane landing" do
    heathrow.land(bertie)
    expect(heathrow.planes_at_airport).to eq(["bertie"])
  end

  it "removes a plane from planes_at_airport when it takes off" do
    heathrow.land(bertie)
    heathrow.take_off(bertie)
    expect(heathrow.planes_at_airport).to eq([])
  end

  it "prevents a plane from landing when the airport is at capacity" do
    heathrow.land(bertie)
    colin = Plane.new('colin')
    expect { heathrow.land(colin) }.to raise_error("A plane can't land, there's no room!")
  end

  it "allows airports to override the default capacity" do
    expect(heathrow.capacity).to eq(1)
    gatwick = Airport.new(5)
    expect(gatwick.capacity).to eq(5)
  end

  it "can only allow a plane to take off if it is on the apron" do
    expect { heathrow.take_off(bertie) } .to raise_error("Plane is not at this airport")
  end

  it "cannot land a plane if already on the apron of that airport" do
    gatwick = Airport.new(5)
    gatwick.land(bertie)
    expect { gatwick.land(bertie) }.to raise_error "This plane is already at this airport"
  end

  it "cannot land a plan if already on the apron of any airport" do
    heathrow.land(bertie)
    gatwick = Airport.new(2)
    expect { gatwick.land(bertie) }.to raise_error "This plane is already at another airport"
  end

  context "when weather is stormy" do
    before do
      allow(weather).to receive(:weather_report).and_return("stormy")
    end

    it "prevents a plane from landing when the weather is stormy" do
      expect { heathrow.land(bertie) }.to raise_error("Plane cannot land during bad weather!")
    end
  end

end
