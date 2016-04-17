require 'airport'

describe Airport do

  it {is_expected.to respond_to(:permission_to_land?).with(1).argument}
  it {is_expected.to respond_to(:permission_to_leave?).with(1).argument}
  it {is_expected.to respond_to(:land_plane).with(1).argument}

  let(:landing_plane) {double :landing_plane, flying?: true, location: subject}
  let(:leaving_plane) {double :leaving_plane, flying?: true, location: subject}
  let(:plane_in_airport) {double :plane_in_airport, flying?: false, location: subject}
  let(:plane_out_airport) {double :plane_out_airport, flying?: true, location: !subject}
  let(:grounded_plane) {double :grounded_plane, flying?: false, location: !"the sky"}
  let(:flying_plane) {double :flying_plane, flying?: true, location: "the sky"}

  it 'should have a default capacity of 25 planes' do
    expect(Airport::DEFAULT_CAPACITY).to eq 25
    expect(subject.capacity).to eq 25
  end

  it 'should be built with empty run-ways' do
    expect(subject.run_way).to eq []
  end

  it 'can be built with different size capacities' do
    expect(Airport.new(20).capacity).to eq 20
  end

  describe '#permission_to_land?' do
    it 'permission granted if weather is good' do
      allow(Weather).to receive(:sunny?).and_return(true)
      expect(subject.permission_to_land?(flying_plane)).to eq true
    end

    it 'permission denied if weather is bad' do
      allow(Weather).to receive(:sunny?).and_return(false)
      expect(subject.permission_to_land?(flying_plane)).to be_falsey
    end

    it 'permission denied if run_way is full' do
      allow(Weather).to receive(:sunny?).and_return(true)
      subject.instance_variable_set(:@capacity,2)
      subject.instance_variable_set(:@run_way, [plane_in_airport,plane_in_airport])
      expect(subject.permission_to_land?(flying_plane)).to be_falsey
    end

    it 'insult if plane is grounded' do
      expect(subject.permission_to_leave?(grounded_plane)).to eq subject.insult(grounded_plane)
    end
  end

  describe '#land_plane' do

    it 'returns current run-way array' do
      subject.instance_variable_set(:@run_way, [plane_in_airport])
      expect(subject.land_plane(landing_plane)).to eq [plane_in_airport,landing_plane]
    end

    it 'adds plane to the run-way' do
      subject.land_plane(landing_plane)
      expect(subject.run_way).to eq [landing_plane]
    end

    it "landing plane must be flying" do
      expect(subject.land_plane(grounded_plane)).to eq "You're still on the ground moron"
    end

    it "landing plane must be at the airport" do
      expect(subject.land_plane(plane_out_airport)).to eq subject.insult(plane_out_airport)
    end
  end

  describe '#permission_to_leave?' do
    it 'permission granted if weather is good' do
      allow(Weather).to receive(:sunny?).and_return(true)
      expect(subject.permission_to_leave?(plane_in_airport)).to eq true
    end

    it 'permission denied if weather is bad' do
      allow(Weather).to receive(:sunny?).and_return(false)
      expect(subject.permission_to_leave?(plane_in_airport)).to be_falsey
    end

    it 'insult if plane is not in airport' do
      expect(subject.permission_to_leave?(plane_out_airport)).to eq subject.insult(plane_out_airport)
    end
  end

  describe '#plane_take_off' do

    it 'retruns the taking-off plane' do
      expect(subject.plane_take_off(leaving_plane)).to eq leaving_plane
    end

    it 'removes plane from the run-way' do
      subject.instance_variable_set(:@run_way, [leaving_plane])
      subject.plane_take_off(leaving_plane)
      expect(subject.run_way).to eq []
    end

    it 'leaving plane must be at airport' do
      expect(subject.plane_take_off(plane_out_airport)).to eq subject.insult(plane_out_airport)
    end

    it 'leaving plane must be flying' do
      expect(subject.plane_take_off(grounded_plane)).to eq "You're still on the ground moron"
    end

    # it "leaving planes must be flying" do
    #   expect(subject.plane_take_off(plane_in_airport)).to eq("You're on the ground moron")
    # end
    #
    # it "landing plane must be at the airport" do
    #   expect(subject.land_plane(plane_out_airport)).to eq subject.insult(plane_out_airport)
    # end
  end




  # describe "#land" do
  #   it "plane will recieve a call to land when weather is fine" do
  #     allow(Weather).to receive(:sunny?).and_return(true)
  #     expect(plane).to receive(:land)  #need to make sure it is recieving sefl as an argument
  #     subject.land(plane)
  #   end
  #
  #   it 'confirms that a plane has landed when weather is fine' do
  #     allow(Weather).to receive(:sunny?).and_return(true)
  #     expect(subject.land(plane)).to eq "That was a bumpy landing sir"
  #   end
  #
  #   it "won't land if not sunny" do
  #     allow(Weather).to receive(:sunny?).and_return(false)
  #     expect {subject.land(plane)}.to raise_error "Not in this weather mate"
  #   end
  #
  #   it "planes can't land when the airport is full" do
  #     allow(Weather).to receive(:sunny?).and_return(true)
  #     Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
  #     expect{subject.land(plane)}.to raise_error("No room here mate")
  #   end
  #
  # end
  #
  # describe "#take_off" do
  #   it 'empty airport will raise an error' do
  #     expect {subject.take_off}.to raise_error("No planes here mate")
  #   end
  #
  #   it "plane will recieve a call to take_off when weather is fine" do
  #     allow(Weather).to receive(:sunny?).and_return(true)
  #     subject.land(plane)
  #     expect(plane).to receive(:take_off)
  #     subject.take_off
  #   end
  #
  #   it 'confirms that a plane has left the airport when weather is fine' do
  #     allow(Weather).to receive(:sunny?).and_return(true)
  #     subject.land(plane)
  #     expect(subject.take_off).to eq "Don't forget to send a postcard"
  #   end
  #
  #   it 'no take off in bad weather' do
  #     allow(Weather).to receive(:sunny?).and_return(true)
  #     subject.land(plane)
  #     allow(Weather).to receive(:sunny?).and_return(false)
  #     expect{subject.take_off}.to raise_error "Not in this weather mate"
  #   end
  #
  #   it 'plane leaves the airport' do
  #     allow(Weather).to receive(:sunny?).and_return(true)
  #     subject.land(plane)
  #     subject.take_off
  #     expect(subject.planes_in_airport).to eq []
  #   end
  # end
  #
  # describe "#planes_in_airport" do
  #   it 'a new airport has no planes' do
  #     expect(subject.planes_in_airport).to eq []
  #   end
  #
  #   it 'list all landed planes' do
  #     allow(Weather).to receive(:sunny?).and_return(true)
  #     subject.land(plane)
  #     expect(subject.planes_in_airport).to eq [plane]
  #   end
  # end



end
