require './docs/airport.rb'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane, flying: true}

  before(:each) do
    allow(plane).to receive(:landed).and_return(flying = false)
    allow(plane).to receive(:depart)
  end

  it "Airport should respond to land method" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "Airport should confirm landed plane" do
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it "Airport should respond to method take off" do
    expect(airport).to respond_to :take_off
  end

  it "Airport should confirm plane is no longer there" do
    airport.land(plane)
    airport.take_off(1)
    expect(airport.planes.empty?).to eq true
  end

  it "Airport should conduct a weather report when instructed" do
    expect(airport).to respond_to :weather_report
  end

  it "Should not let plane take off due to dangerous weather" do
      airport.land(plane)
      airport.sunny = false
      expect{airport.take_off(1)}.to raise_error "Weather is too dangerous to depart!"
  end

  it "During a storm, airport should not let any planes land" do
    allow(airport).to receive(:sunny).and_return(false)
    expect{airport.land(plane)}.to raise_error "Weather is too dangerous to land!"
  end

  it "If airport is full planes should not be able to land" do
    airport.capacity.times {airport.land(plane)}
    expect{airport.land(plane)}.to raise_error "This airport is full, please redirect to closest airport"
  end

  it "Tests if airport has a variable capacity" do
    airport = Airport.new(20)
    20.times{airport.land(plane)}
    expect{airport.land(plane)}.to raise_error "This airport is full, please redirect to closest airport"
  end

  it "Should not be able to land a plane that's already landed" do
    airport.land(plane)
    allow(plane).to receive(:flying).and_return(false)
    expect{airport.land(plane)}.to raise_error "That plane has already landed!"
  end

  it "A landed plane should not be able to land in another airport" do
    airport.land(plane)
    allow(plane).to receive(:flying).and_return(false)
    expect(airport.planes[0].flying).to equal(false)
  end

end
