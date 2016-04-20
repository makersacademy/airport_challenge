require 'airport'
require 'rspec/expectations'

describe Airport do
  let(:flying_plane) {double :flying_plane, landed: false}
  let(:grounded_plane) {double :grounded_plane, landed: true}

  describe "#land" do

    it {should respond_to(:land).with(1).argument}

    it "it should accept a plane and confirm it has landed" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.land(flying_plane)
      expect(subject.planes.last).to eq flying_plane
    end

    it "airport should prevent landing when stormy" do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      expect{subject.land(flying_plane)}.to raise_error "Too stormy to land"
    end

    it "will prevent landing when airport is full" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.capacity.times{subject.land(flying_plane)}
      expect{subject.land(flying_plane)}.to raise_error "Airport full! No space to land"
    end

    it "plane cannot land if already on the ground" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      expect{subject.land(grounded_plane)}.to raise_error "Already landed"
    end

    it "system designer can set capacity of the airport" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      new_capacity = 2
      subject.capacity = new_capacity
      new_capacity.times{subject.land(flying_plane)}
      expect{subject.land(flying_plane)}.to raise_error "Airport full! No space to land"
    end
  end

  describe "#take_off" do

    it {should respond_to(:take_off).with(1).argument}

    it "plane should take off and confirm it is no longer at the Airport" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.land(flying_plane)
      allow(flying_plane).to receive(:landed).and_return(true)
      subject.take_off(flying_plane)
      expect(subject.wrong_airport?(flying_plane)).to eq true
    end

    it "airport should prevent take off when stormy" do

      allow(subject).to receive(:stormy_weather?).and_return(true)
      allow(subject).to receive(:wrong_airport?).and_return(false)
      expect{subject.take_off(grounded_plane)}.to raise_error "Too stormy for take off"
    end

    it "should raise error if taking off from wrong airport" do
      heathrow = Airport.new
      lax = Airport.new
      allow(heathrow).to receive(:stormy_weather?).and_return(false)
      allow(lax).to receive(:stormy_weather?).and_return(false)
      heathrow.land(flying_plane)
      expect{lax.take_off(grounded_plane)}.to raise_error "Wrong airport!"
    end

    it "plane cannot take off if already flying" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      expect{subject.take_off(flying_plane)}.to raise_error "Plane already flying"
    end
  end
end
