require './lib/airport.rb'

describe Airport do
let(:plane) {double :plane}
  describe '#release_plane' do

    it 'responds to "release_plane"' do
      expect(subject).to respond_to :release_plane
    end

    it 'releases one stored plane' do
      # aeroplane = Plane.new
      allow(plane).to receive(:is_it_stormy).and_return(false)
      allow(plane).to receive(:stormy).and_return(true)
      subject.accept_plane(plane)
      expect(subject.release_plane(plane)).to eq plane
    end

    it "doesn't release a plane when none are stored in airport" do
      expect {subject.release_plane(Plane.new)}.to raise_error "No planes here to fly!"
    end

    it "can't release plane if it is in stormy weather" do
      plane = double(:plane, stormy: true, flying: false)
      subject.accept_plane(Plane.new)
      expect {subject.release_plane(plane)}.to raise_error "Too stormy to fly!"
    end

  end

  describe '#accepts_plane' do

    it 'stores a plane when plane is passed as an argument' do
      aeroplane = Plane.new
      expect(subject.accept_plane(aeroplane)).to eq [aeroplane]
    end

    it "doesn't accept plane when capacity is full" do
      20.times {subject.accept_plane(Plane.new)}
      expect {subject.accept_plane(Plane.new)}.to raise_error "Airport full!"
    end

    it "doesn't accept plane when it is already stored" do
      aeroplane = Plane.new
      subject.accept_plane(aeroplane)
      expect {subject.accept_plane(aeroplane)}.to raise_error "Plane already landed!"
    end

    it "can't accept plane if it is in stormy weather" do
      plane = double(:plane, stormy: true, flying: true)
      expect {subject.accept_plane(plane)}.to raise_error "Too stormy to land!"
    end

    end
  end
