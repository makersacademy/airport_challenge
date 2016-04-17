require 'plane'

describe Plane do
  it {is_expected.to respond_to(:broadcast_location)}
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}



  let(:clear_airport) {
    double :clear_airport,
    class: Airport,
    permission_to_land?: true,
    permission_to_leave?: true,
    land_plane: [subject],
    plane_take_off: subject
  }

  let(:stormy_airport) {
    double :stormy_airport,
    class: Airport,
    permission_to_land?: false,
    permission_to_leave?: false
  }

  let(:not_airport) {double :not_airport, class: !Airport}

  # let(:airport2) {double :airport2, class: Airport, permission_to_land?: true}
  # let(:airport_no_permission) {double :airport_no_permission, class: Airport, permission_to_land?: false}
  # let(:not_airport) {double :not_airport, class: !Airport}
  # let(:crashed_plane) {double :crashed_plane, location: "a field", crashed?: true}


  describe "#broadcast_location" do
    it 'is expected to know where it is unless crashed' do
      expect(subject.broadcast_location).to eq "the sky"
      subject.instance_variable_set(:@crashed, true)
      expect(subject.broadcast_location).to eq subject.static
    end

  end

  describe "#land" do
    it "only flying planes can land" do
      subject.instance_variable_set(:@flying, false)
      expect(subject.land(stormy_airport)).to eq subject.insult
    end

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

    it "if location not airport then crash" do
      expect(subject).to receive(:crash)
      subject.land(not_airport)
    end

    it "if location not provided then crash in a field" do
      expect(subject).to receive(:crash)
      subject.land(not_airport)
    end

    describe 'crash' do
      it "crash landings leave planes in fields" do
        subject.land
        expect(subject).to be_crashed
        expect(subject).not_to be_flying
        expect(subject.broadcast_location).to eq "... ..."
      end
    end
  end

  describe "#take_off" do
    it 'only grounded planes can take_off' do
      expect(subject.take_off(stormy_airport)).to eq subject.insult
    end

    it 'only takes-off from present location' do
      subject.instance_variable_set(:@location, clear_airport)
      expect(subject.take_off(stormy_airport)).to eq subject.insult
    end

    it "crashed planes can't takes-off" do
      subject.instance_variable_set(:@location, clear_airport)
      subject.instance_variable_set(:@crashed, true)
      expect(subject.take_off(clear_airport)).to eq "... ..."
    end

    it "need permission to take_off from airports" do
      subject.instance_variable_set(:@location, clear_airport)
      subject.instance_variable_set(:@flying, false)
      expect(clear_airport).to receive(:permission_to_leave?)
      subject.take_off(clear_airport)
    end

    it "if permission granted receives a call to take_off" do
      subject.instance_variable_set(:@location, clear_airport)
      subject.instance_variable_set(:@flying, false)
      expect(clear_airport).to receive(:plane_take_off)
      subject.take_off(clear_airport)
      expect(stormy_airport).not_to receive(:plane_take_off)
      subject.take_off(stormy_airport)
    end

    it "if permission granted location is sky" do
      subject.instance_variable_set(:@location, clear_airport)
      subject.instance_variable_set(:@flying, false)
      subject.take_off(clear_airport)
      expect(subject.broadcast_location).to eq "the sky"
    end

    it "if permission not granted location stays the same" do
      subject.instance_variable_set(:@location, stormy_airport)
      subject.instance_variable_set(:@flying, false)
      subject.take_off(stormy_airport)
      expect(subject.broadcast_location).to eq stormy_airport
    end

    it "if permission granted plane is flying" do
      subject.instance_variable_set(:@location, clear_airport)
      subject.instance_variable_set(:@flying, false)
      subject.take_off(clear_airport)
      expect(subject).to be_flying
    end

    it "if permission not granted plane remains on the ground" do
      subject.instance_variable_set(:@location, stormy_airport)
      subject.instance_variable_set(:@flying, false)
      subject.take_off(stormy_airport)
      expect(subject).not_to be_flying
    end

    it "if permission granted location set after call to land" do

    end

    it "if permission granted flying set before call to land" do

    end

  end




















  describe '#complain' do
    it 'complains about weather' do
      expect(subject.complain).to eq ("Permission denied: turn that bird around")
    end
  end

  describe '#insult' do
    it 'insults mis-directed pilots' do
      expect(subject.insult).to eq "You been on the wacky-backy, You're in #{subject.location}"
    end
  end

  describe '#static' do
    it '... ...' do
      expect(subject.static).to eq "... ..."
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
