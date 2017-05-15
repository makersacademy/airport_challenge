require 'airport'

describe Airport do


    it 'has variable to recieve and store planes' do
      expect(subject.planes).to eq []
    end

    it { is_expected.to respond_to(:confirm_landing).with(1).argument }

    it { is_expected.to respond_to(:confirm_take_off).with(1).argument }


    it 'Has weather variable' do
      expect(subject).to respond_to :weather
    end

    it 'Has capacity variable' do
      expect(subject).to respond_to :capacity
    end

    it '@capacity is automatically DEFAULT_CAPACITY' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'Can change @capacity with capacity=' do
      expect(subject.capacity = 10).to eq 10
    end

    it 'Responds to set_capacity' do
      expect(subject).to respond_to :set_capacity
    end

    it 'Responds to #full?' do
      expect(subject).to respond_to :full?
    end

  describe '#land_plane' do

    it "Adds 'plane' to '@planes' when passed to 'land_plane'" do
      plane = double(:plane)
      subject.weather = :sunny
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it "Will raise an error when weather is 'stormy'" do
      plane = double(:plane)
      subject.weather = :stormy
      expect {subject.land_plane(plane)}.to raise_error("Weather stormy: Unsafe for landing")
    end

    it "Will raise an error when airport is full (at @capacity)" do
      Airport::DEFAULT_CAPACITY.times {subject.land_plane(double(:plane))}
      plane = double(:plane)
      subject.weather = :sunny
      expect {subject.land_plane(plane)}.to raise_error("Airport at capacity: Unsafe to land")
    end

  end

  describe '#confirm_landing' do

    it "Checks for 'plane' in @planes" do
      plane = double(:plane)
      subject.weather = :sunny
      subject.land_plane(plane)
      expect(subject.confirm_landing(plane)).to eq true
    end

  end

  describe '#take_off' do

    it "Removes 'plane' from @planes" do
      plane = double(:plane)
      subject.land_plane(plane)
      subject.weather = :sunny
      expect(subject.take_off(plane)).to eq []
    end

    it "Removes only 'plane' specified from @planes" do
      plane, plane2 = double(:plane), double(:plane)
      subject.land_plane(plane)
      subject.land_plane(plane2)
      subject.weather = :sunny
      expect(subject.take_off(plane)).to eq [plane2]
    end

    it "Will raise an error when weather is 'stormy'" do
      plane = double(:plane)
      subject.weather = :stormy
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

    it "returns false if @weather is not 'stormy'" do
      expect(subject.stormy?).to eq false
    end

  end

  describe '#full' do

    it 'returns true if @planes equals @capacity' do
      plane1, plane2 = double(:plane), double(:plane)
      subject.planes = [plane1, plane2]
      subject.capacity = 2
      expect(subject.full?).to eq true
    end

  end


end
