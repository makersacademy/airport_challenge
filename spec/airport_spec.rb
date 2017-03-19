require './lib/airport.rb'

describe Airport do

  describe '#release_plane' do

    it 'responds to "release_plane"' do
      expect(subject).to respond_to :release_plane
    end

    it 'releases one stored plane' do
      aeroplane = Plane.new
      allow(subject).to receive(:weather_strength) { 10 }
      subject.accept_plane(aeroplane, subject)
      expect(subject.release_plane(aeroplane, subject)).to eq aeroplane
    end

    it "doesn't release a plane when none are stored in airport" do
      expect {subject.release_plane(Plane.new, subject)}.to raise_error "No planes here to fly!"
    end

    it "can't release plane if it is in stormy weather" do
      airport = Airport.new
      airport.stub(:stormy).and_return(false)
      plane = Plane.new
      airport.accept_plane(plane, airport)
      airport.stub(:stormy).and_return(true)
      expect {airport.release_plane(plane, airport)}.to raise_error "Too stormy to fly!"
    end

    it "can't release plane if it isn't specifically stored in the airport" do
      subject.stub(:stormy).and_return(false)
      plane = Plane.new
      subject.accept_plane(plane, subject)
      expect {subject.release_plane(Plane.new, subject)}.to raise_error "That plane isn't stored here!"
    end

  end

  describe '#accepts_plane' do

    it 'stores a plane when plane is passed as an argument' do
      aeroplane = Plane.new
      allow(subject).to receive(:weather_strength) { 10 }
      expect(subject.accept_plane(aeroplane, subject)).to eq [aeroplane]
    end

    it "doesn't accept plane when capacity is full" do
      allow(subject).to receive(:weather_strength) { 10 }
      20.times {subject.accept_plane(Plane.new, subject)}
      expect {subject.accept_plane(Plane.new, subject)}.to raise_error "Airport full!"
    end

    it "doesn't accept plane when it is already stored" do
      aeroplane = Plane.new
      allow(subject).to receive(:weather_strength) { 10 }
      subject.accept_plane(aeroplane, subject)
      expect {subject.accept_plane(aeroplane, subject)}.to raise_error "Plane already landed!"
    end

    it "can't accept plane if it is in stormy weather" do
      plane = Plane.new
      allow(subject).to receive(:weather_strength) { 90 }
      expect {subject.accept_plane(plane, subject)}.to raise_error "Too stormy to land!"
    end

    end

  end
