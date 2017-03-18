require 'airport.rb'

describe Airport do

  describe "#initialize" do
    it "capacity can be user set" do
      airport = Airport.new(3)
      plane = double(:plane)
      allow(airport).to receive(:fly_okay?).and_return(true)
      3.times {airport.land_plane(plane)}
      expect{ airport.land_plane(plane) }.to raise_error "Airport full!!!"
    end
  end

  describe "#land_plane" do
    it { is_expected.to respond_to :land_plane }

    it "accepts a plane to land" do
      plane = double(:plane)
      subject.land_plane(plane)
      allow(subject).to receive(:fly_okay?).and_return(true)
      expect(subject.count_planes).to eq 1
    end

    it "accepts multiple planes" do
      plane = double(:plane)
      allow(subject).to receive(:fly_okay?).and_return(true)
      10.times { subject.land_plane(plane) }
      expect(subject.count_planes).to eq 10
    end

    it "stops a plane landing if there is stormy weather" do
      plane = double(:plane)
      allow(subject).to receive(:fly_okay?).and_return(false)
      expect{ subject.land_plane(plane) }.to raise_error "Landing delayed due stormy weather"
    end

    it "prevents plane from landing when airport full" do
      plane = double(:plane)
      allow(subject).to receive(:fly_okay?).and_return(true)
      Airport::DEFAULT_CAPACITY.times {subject.land_plane(plane)}
      expect{ subject.land_plane(plane) }.to raise_error "Airport full!!!"
    end
  end

  describe "#take_off" do
    it "lets a plane take off" do
      plane = double(:plane)
      subject.planes << [plane,plane]
      allow(subject).to receive(:fly_okay?).and_return(true)
      subject.take_off(plane)
      expect(subject.count_planes).to eq 1
    end

    it "stops take off in the event of stormy weather" do
      plane = double(:plane)
      subject.planes << [plane,plane]
      allow(subject).to receive(:fly_okay?).and_return(false)
      expect{subject.take_off(plane)}.to raise_error "Flight canceled due stormy weather"
    end
  end

  describe "#fly_okay?" do
    it "confirms planes can fly in normal weather" do
    allow(Weather).to receive(:check_weather).and_return("Safe to fly")
    expect(subject.fly_okay?).to eq true
    end

    it "confirms planes cann't fly in stormy weather" do
    allow(Weather).to receive(:check_weather).and_return("Stormy")
    expect(subject.fly_okay?).to eq false
    end
  end

end
