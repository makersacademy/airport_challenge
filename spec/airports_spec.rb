require 'airports'

describe Airport do

  describe "hangar" do
    it "has an array called hangar" do
      expect(subject.hangar).to eq([])
    end
  end

  describe "capacity" do

    it "has constant DEFAULT_CAPACITY" do
      expect(Airport::DEFAULT_CAPACITY).to eq(20)
    end

    it 'Lets you choose max capacity' do
      expect(Airport.new(25).capacity).to eq(25)
    end

    it 'Defult capacity set to 20' do
      expect(Airport.new().capacity).to eq(20)
    end
  end

  describe 'stormy?' do
    
    it "responds to stormy with false" do
      expect(subject.stormy?).to eq false
    end
  end

  describe 'weather_update' do
    it "updates and responds correctly when stormy? called" do
      subject.weather_update(true)
      expect(subject.stormy?).to eq true
    end
  end
end

describe Plane do

  describe "location" do
    it 'saves starting airport object as location variable' do
      heathrow = double()
      expect(Plane.new(heathrow).location[0]).to eq(heathrow)
    end

    it 'defaults location to SKY when no argument given' do
      expect(Plane.new.location[0]).to eq('SKY')
    end

    it "adds itself to hanger when given airport as argument" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false, :is_a? => true)
      plane = Plane.new(heathrow)
      expect(heathrow.hangar).to eq([plane])
    end

    it "throws error when you try to add a new plane to a full airport" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false, :is_a? => true)
      20.times { Plane.new(heathrow) }
      expect { Plane.new(heathrow) }.to raise_error(RuntimeError, "Airport full.")
    end
  end

  describe "land" do
    it "responds to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "adds itself to the hangar in the airport it is landing at" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false)
      subject.land(heathrow)
      expect(heathrow.hangar).to eq([subject])
    end
    it "responds 'Airport full' if hangar full" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false)
      20.times { heathrow.hangar << Plane.new }
      expect { subject.land(heathrow) }.to raise_error(RuntimeError, 'Airport full.')
    end
    it "updates its own location to airport it is landing at" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false)
      subject.land(heathrow)
      expect(subject.location[0]).to eq(heathrow)
    end
    it "throws error if weather is stormy at airport" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => true)
      expect { subject.land(heathrow) }.to raise_error(RuntimeError, "Too stormy to land.")
    end
    it "throws error if already at an airport" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false)
      subject.land(heathrow)
      expect { subject.land(heathrow) }.to raise_error(RuntimeError, "Already at an airport.")
    end
  end

  describe "takeoff" do
    it "responds to takeoff" do
      expect(subject).to respond_to(:takeoff)
    end
    it "errors when plane not in airport" do
      expect { subject.takeoff }.to raise_error(RuntimeError, "Not in an airport.")
    end
    it 'throws errror when stormy at airport' do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => true, :is_a? => true)
      plane = Plane.new(heathrow)
      expect { plane.takeoff }.to raise_error(RuntimeError, "Too stormy to takeoff.")
    end
    it "removes self from hangar array if it takes off" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false, :is_a? => true)
      subject.land(heathrow)
      expect(heathrow.hangar).to eq([subject])
      subject.takeoff
      expect(heathrow.hangar).to eq([])
   	end
   	it "removes updates location to SKY" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false, :is_a? => true)
      subject.land(heathrow)
      subject.takeoff
      expect(subject.location).to eq(['SKY'])
   	end
  end
  
  describe "takenoff?" do
    it "responds true after taking off" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false, :is_a? => true)
      plane = Plane.new(heathrow)
      plane.takeoff
      expect(plane.takenoff?).to eq true
    end
    it "responds false if sat in airport" do
      heathrow = double(:hangar => [], :capacity => 20, :stormy? => false, :is_a? => true)
      plane = Plane.new(heathrow)
      expect(plane.takenoff?).to eq true
    end
  end
end
