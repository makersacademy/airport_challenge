require 'airport'

describe Airport do

  before do
      plane = double(:plane)
    end

    it 'has variable to recieve and store planes' do
      expect(subject.planes).to eq []
    end

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
      subject.weather = :stormy
      expect {subject.land_plane(double(:plane))}.to raise_error("Weather stormy: Unsafe for landing")
    end

    it "Will raise an error when airport is full (at @capacity)" do
      Airport::DEFAULT_CAPACITY.times {subject.land_plane(double(:plane))}
      expect {subject.land_plane(double(:plane))}.to raise_error("Airport at capacity: Unsafe to land")
    end

    # it "Will raise error if plane is already grounded" do
    #   plane = double(:plane, airborne: true)
    #   expect {subject.land_plane(plane)}.to raise_error("Plane not airborne")
    # end

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

    it "Returns 'true' when the 'plane' has left airport but @planes is not empty" do
      plane1, plane2 = double(:plane), double(:plane)
      subject.land_plane(plane1)
      subject.land_plane(plane2)
      expect(subject.take_off(plane1)).to eq [plane2]
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
