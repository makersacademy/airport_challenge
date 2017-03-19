require './lib/airport.rb'

describe Airport do

  describe '#release_plane' do

    it 'responds to "release_plane"' do
      expect(subject).to respond_to :release_plane
    end

    it 'releases one stored plane' do
      #aeroplane = Plane.new
      aeroplane = double(:plane, in_flight: true, land: true, flying: true)
      allow(subject).to receive(:weather_strength) { 10 }
      subject.accept_plane(aeroplane, subject)
      expect(subject.release_plane(aeroplane, subject)).to eq aeroplane
    end

    it "doesn't release a plane when none are stored in airport" do
      plane = double(:plane)
      expect {subject.release_plane(plane, subject)}.to raise_error "No planes here to fly!"
    end

    it "can't release plane if it is in stormy weather" do
      subject.stub(:stormy).and_return(false)
      plane = double(:plane, in_flight: true, land: true, flying: true)
      subject.accept_plane(plane, subject)
      subject.stub(:stormy).and_return(true)
      expect {subject.release_plane(plane, subject)}.to raise_error "Too stormy to fly!"
    end

    it "can't release plane if it isn't specifically stored in the airport" do
      subject.stub(:stormy).and_return(false)
      subject.accept_plane(double(:plane, flying: true, in_flight: true, land: true), subject)
      expect {subject.release_plane(double(:plane, flying: true, in_flight: true, land: true), subject)}.to raise_error "That plane isn't stored here!"
    end

  end

  describe '#accepts_plane' do

    it 'stores a plane when plane is passed as an argument' do
      aeroplane = double(:plane, flying: true, in_flight: true, land: true)
      allow(subject).to receive(:weather_strength) { 10 }
      expect(subject.accept_plane(aeroplane, subject)).to eq [aeroplane]
    end

    it "doesn't accept plane when capacity is full" do
      allow(subject).to receive(:weather_strength) { 10 }
      20.times {subject.accept_plane(double(:plane, flying: true, in_flight: true, land: true), subject)}
      expect {subject.accept_plane(double(:plane, flying: true, in_flight: true, land: true), subject)}.to raise_error "Airport full!"
    end

    it "doesn't accept plane when it is already stored" do
      aeroplane = double(:plane, flying: true, in_flight: true, land: true)
      allow(subject).to receive(:weather_strength) { 10 }
      subject.accept_plane(aeroplane, subject)
      expect {subject.accept_plane(aeroplane, subject)}.to raise_error "Plane already landed!"
    end

    it "can't accept plane if it is in stormy weather" do
      plane = double(:plane, flying: true, in_flight: true, land: true)
      allow(subject).to receive(:weather_strength) { 90 }
      expect {subject.accept_plane(plane, subject)}.to raise_error "Too stormy to land!"
    end

    end

  end
