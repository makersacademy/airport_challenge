require 'airport'

describe Airport do

  let(:jumbo) { Plane.new } 
 
  context '#landing' do

    it { is_expected.to respond_to :land }

    it "expects one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "return a Plane object" do
      expect(subject.land(jumbo)).to be_an_instance_of(Plane)
    end

    it "lands the plane" do
      expect(subject.land(jumbo)).to eq(jumbo)
    end

    it "stores plane in hanger on landing" do
        expect(subject.store(jumbo)).to contain_exactly( an_object_having_attributes(jumbo))
     end
  end

  context '# take_off' do
  
    it { is_expected.to respond_to :take_off }

    it "take_off expects one argument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "a plane takes off" do
      expect(subject.take_off(jumbo)).to eq(jumbo)
    end

    it "plane no longer at airport" do
        
      expect([@hanger]).not_to include(jumbo)
    end 
  end
end
