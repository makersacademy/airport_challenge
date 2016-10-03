require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:weather) { double(:weather) }

  subject(:airport) { described_class.new weather}

  # let(:bad_weather) {described_class.new :stormy => true }
  # let(:sunny_weather) {described_class.new :stormy => false}
  let(:plane) {double(:plane)}



  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }


  it "creates an airport" do
    expect(described_class).to eq Airport
  end

  it "creates an airport with a default capacity of 10 planes by default" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "creates an airport with a capacity of an arugment given" do
    airport1 = Airport.new(15, weather)
    expect(airport1.capacity).to eq 15
  end

  context 'Sunny weather' do

    before do
        allow(weather).to receive(:random_weather).and_return(false)
      end

  it "prevents landing when the airport is full " do
    Airport::DEFAULT_CAPACITY.times do
      subject.land(Plane.new)

    end
      expect{subject.land(Plane.new)}.to raise_error "Airport is full."
    end

  it "raises an error when a take-off is requested from an empty airport" do
    @planes = 0
    expect{subject.take_off(@plane)}.to raise_error "Airport is empty"
  end

  it "raises an error when a requested plane is not in the airport to take off" do
    plane2 = Plane.new
    subject.land(plane2)
    expect{subject.take_off(@plane)}.to raise_error "That plane is not at this airport"
  end

   it "allows a specific plane to take off when requested" do
     plane2 = Plane.new
     subject.land(@plane)
     subject.land(plane2)
     subject.take_off(@plane)
     expect(subject.planes).not_to include(@plane)
  end

  it "only lets you land a plane once at an airport" do
    subject.land(@plane)
    expect{subject.land(@plane)}.to raise_error "That plane has already landed."
  end
end

context 'Bad weather' do

  before do
        allow(weather).to receive(:random_weather).and_return(true)
      end


  it "raises an error when you try to land in stormy conditions" do
    expect{subject.land(plane)}.to raise_error "The weather is too bad. Try again later."
  end

  it "raises an error when you try to take_off in stormy conditions" do
    expect{subject.take_off(plane)}.to raise_error "The weather is too bad. Try again later."
  end
end

end
