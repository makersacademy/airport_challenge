require './lib/airport.rb'

describe Airport do

  it "Airport should respond to land method" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "Airport should confirm landed plane" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it "Airport should respond to method take off" do
    expect(subject).to respond_to :take_off
  end

  it "Airport should confirm plane is no longer there" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(1)
    expect(subject.planes.empty?).to eq true
  end

  it "Airport should conduct a weather report when instructed" do
    expect(subject).to respond_to :weather_report
  end

  it "Should not let plane take off due to dangerous weather" do
      subject.land(Plane.new)
      subject.sunny = false
      expect{subject.take_off(1)}.to raise_error "Weather is too dangerous to depart!"
  end

  it "During a storm, airport should not let any planes land" do
    subject.sunny = false
    expect{subject.land(Plane.new)}.to raise_error "Weather is too dangerous to land!"
  end

  it "If airport is full planes should not be able to land" do
    subject.capacity.times {subject.land(Plane.new)}
    expect{subject.land(Plane.new)}.to raise_error "This airport is full, please redirect to closest airport"
  end

  it "Tests if airport has a variable capacity" do
    airport = Airport.new(20)
    20.times{airport.land(Plane.new)}
    expect{airport.land(Plane.new)}.to raise_error "This airport is full, please redirect to closest airport"
  end

  it "Should not be able to land a plane that's already landed" do
    plane = Plane.new
    subject.land(plane)
    expect{subject.land(plane)}.to raise_error "That plane has already landed!"
  end

  it "A landed plane should not be able to land in another airport" do
    plane = Plane.new
    airport1 = Airport.new
    airport2 = Airport.new
    airport1.land(plane)
    expect{airport2.land(plane)}.to raise_error "That plane has already landed!"
  end

end
