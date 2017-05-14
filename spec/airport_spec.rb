require 'airport'

describe Airport do

    it "Responds to #land_plane method" do
      expect(subject).to respond_to :land_plane
    end

    it 'has variable to recieve and store planes' do
      expect(subject.planes).to eq []
    end

    it "Responds to #confirm_landing method" do
      expect(subject).to respond_to :confirm_landing
    end

    it "Responds to #take_off method" do
      expect(subject).to respond_to :take_off
    end

    it "Responds to #confirm_take_off" do
      expect(subject).to respond_to :confirm_take_off
    end

    it "Responds to #stormy?" do
      expect(subject).to respond_to :stormy?
    end

    it 'Has weather variariable' do
      expect(subject).to respond_to :weather
    end

  describe '#land_plane' do

    it "Adds 'plane' to '@planes' when passed to 'land_plane'" do
      plane = double(:plane)
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it "Will raise an error when weather is 'stormy'" do
      plane = double(:plane)
      subject.weather = 'stormy'
      expect {subject.land_plane(plane)}.to raise_error("Weather stormy: Unsafe for landing")
    end

  end

  describe '#confirm_landing' do

    it "Checks for 'plane' in @planes" do
      plane = double(:plane)
      subject.land_plane(plane)
      expect(subject.confirm_landing(plane)).to eq true
    end

  end

  describe '#take_off' do

    it "Removes 'plane' from @planes" do
      plane = double(:plane)
      subject.land_plane(plane)
      expect(subject.take_off(plane)).to eq []
    end

    it "Removes only one 'plane' from @planes" do
      plane, plane2 = double(:plane), double(:plane)
      subject.land_plane(plane)
      subject.land_plane(plane2)
      expect(subject.take_off(plane)).to eq [plane2]
    end

    it "Will raise an error when weather is 'stormy'" do
      plane = double(:plane)
      subject.weather = 'stormy'
      expect {subject.take_off(plane)}.to raise_error("Weather stormy: Unsafe for take off")
    end

  end

  describe '#confirm_take_off' do

    it "Confirms that 'plane' is no longer in @planes" do
      plane = double(:plane)
      expect(subject.confirm_take_off(plane)).to eq true
    end

  end

  describe '#stormy' do

    it "responds false if @weather is not 'stormy'" do
      expect(subject.stormy?).to eq false
    end

  end


end
