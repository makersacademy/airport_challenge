require 'airport'

describe Airport do
  
  subject(:city) { Airport.new(5) }
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
      5.times { city.land(jumbo) }
      expect { city.land(jumbo) }.to raise_error "Airport is full"
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
end
