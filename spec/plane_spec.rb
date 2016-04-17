require 'plane'

describe Plane do
  it {is_expected.to respond_to(:broadcast_location)}
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}



  let(:clear_airport) {double :clear_airport, class: Airport, permission_to_land?: true, land_plane: [subject]}
  let(:stormy_airport) {double :stormy_airport, class: Airport, permission_to_land?: false}
  let(:not_airport) {double :not_airport, class: !Airport}


  # let(:airport2) {double :airport2, class: Airport, permission_to_land?: true}
  # let(:airport_no_permission) {double :airport_no_permission, class: Airport, permission_to_land?: false}
  # let(:not_airport) {double :not_airport, class: !Airport}
  # let(:crashed_plane) {double :crashed_plane, location: "a field", crashed?: true}


  describe "#broadcast_location" do
    it 'is expected to know where it is' do
      expect(subject.broadcast_location).to eq "the sky"
    end
  end

  describe "#land" do

    it "need permission to land at airports" do
      expect(clear_airport).to receive(:permission_to_land?)
      subject.land(clear_airport)
    end

    it "if permission granted receives a call to land" do
      expect(clear_airport).to receive(:land_plane)
      subject.land(clear_airport)
      expect(stormy_airport).not_to receive(:land_plane)
      subject.land(stormy_airport)
    end

    it "if permission granted location is airport" do
      plane1 = Plane.new
      plane1.land(clear_airport)
      expect(plane1.broadcast_location).to eq clear_airport
      plane2 = Plane.new
      plane2.land(stormy_airport)
      expect(plane2.broadcast_location).not_to eq stormy_airport
    end

    it "if permission granted plane is on ground" do
      plane1 = Plane.new
      plane1.land(clear_airport)
      expect(plane1).not_to be_flying
      plane2 = Plane.new
      plane2.land(stormy_airport)
      expect(plane2.broadcast_location).to eq 'the sky'
    end

    it "if permission granted location set before call to land" do

    end

    it "if permission granted flying set after call to land" do

    end

    it "if permission not granted complain about the weather" do
      expect(subject.land(stormy_airport)).to eq subject.complain
    end

    it "if land location not airport then crash" do
      expect(subject).to receive (:crash)
      subject.land(not_airport)
    end

    describe 'crash_landing'

    # it "planes don't need permission to land anywhere else" do
    #   expect(not_airport).not_to receive(:permission_to_land?)
    #   subject.land(not_airport)
    # end
    #
    # it "planes land safely at airports if permission is granted" do
    #   expect(subject.land(airport)).to eq nil
    #   expect(subject.broadcast_location).to eq airport
    #   expect(subject).not_to be_flying
    #   expect(subject).not_to be_crashed
    # end
    #
    # it "planes don't land at airports if permission is not granted" do
    #   expect(subject.land(airport_no_permission)).to eq "A couple more laps of the run-way folks"
    #   expect(subject.broadcast_location).to eq "the sky"
    #   expect(subject).to be_flying
    #   expect(subject).not_to be_crashed
    # end
    #
    # describe '#crash' do
    #   it "plane crash-lands if no location is provided" do
    #     expect(subject.land).to eq "Crash landing"
    #     expect(subject).not_to be_flying
    #   end
    #
    #   it "some crash landings are safe" do
    #     allow(subject).to receive(:rand).and_return(0)
    #     subject.land
    #     expect(subject).not_to be_crashed
    #     expect(subject.broadcast_location).to eq "a field"
    #   end
    #
    #   it "some crash landings are not" do
    #     allow(subject).to receive(:rand).and_return(1)
    #     subject.land
    #     expect(subject).to be_crashed
    #     expect(subject.broadcast_location).to eq "... ..."
    #   end
    #
    #   it "only planes in the sky can land" do
    #     subject.land(airport)
    #     expect{subject.land(airport)}.to raise_error("You yanking my crank, I'm on the effin' tarmac")
    #   end
    # end
  end

  describe '#complain' do
    it 'complains about weather' do
      expect(subject.complain).to eq ("It's bloody cats and dogs out there")
    end
  end


  # describe "#take_off" do
  #   it "location will be 'the sky' whilst flying" do
  #     expect(subject.broadcast_location).to eq "the sky"
  #     expect(subject).to be_flying
  #   end
  #
  #   it "have a nil return value" do
  #     subject.land(airport)
  #     expect(subject.take_off(airport)).to eq nil
  #   end
  #
  #   it "flying planes can't take off" do
  #     expect{subject.take_off(airport)}.to raise_error("I'm already up here mate")
  #   end
  #
  #   it "can only take off from current location" do
  #     subject.land(airport)
  #     expect{subject.take_off(airport2)}.to raise_error("You frickin' loopy, I'm in #{airport}")
  #   end
  #
  #   it "crashed planes can't take off" do
  #     allow(subject).to receive(:rand).and_return(1)
  #     subject.land
  #     expect{subject.take_off("a field")}.to raise_error("This birds got no wings")
  #   end
  #
  #
  # end
end
