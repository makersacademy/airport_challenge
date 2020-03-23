require 'airport'

describe Airport do
  
  subject(:city) { Airport.new }
  let(:jumbo) { Plane.new } 
 
  context '#landing' do

    it { is_expected.to respond_to :land }

    it "expects one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "lands the plane" do
      @hanger = []
      expect(subject.land(jumbo)).to be subject.store(jumbo)
    end

    it "stores plane in hanger on landing" do
      @hanger = subject.store(jumbo)
      expect(@hanger).to include(jumbo)
    end

    it "raises error if airport is full" do
      subject.change_capacity(5)
      5.times { city.land(jumbo) }
      expect { city.land(jumbo) }.to raise_error "Airport is full"
    end

    it "is a plane at the airport" do
      subject.store(jumbo)
      expect(subject.plane_in_hanger?(jumbo)).to eq true
    end
  end

  context '#take_off' do
  
    it { is_expected.to respond_to :take_off }

    it "take_off expects one argument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "a plane takes off" do
      expect(subject.take_off(jumbo)).to eq "Plane takes off!"
    end

    it "plane no longer at airport" do
      expect([@hanger]).not_to include(jumbo)
    end 
  end

  context '#set_capacity' do

    it "initial capacity is DEFAULT_CAPACITY" do
      expect(subject.collect_capacity).to eq Airport::DEFAULT_CAPACITY
    end
    
    it "overrides DEFAULT_CAPACITY" do
      expect(subject.change_capacity(20)).to eq 20
    end
  end
end
