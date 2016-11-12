require "weather"

describe Weather do

  describe "#generator" do
    it "should return truthy answer when accessed" do
      expect( subject.today ).to be_truthy
    end
    it "should return number when accessed" do
      expect( subject.generator ).to be_a_kind_of( Integer )
    end
  end

  describe "#today" do
    it { is_expected.to respond_to :today }
    it "should return truthy answer when accessed" do
      expect( subject.today ).to be_truthy
    end

    it "should return 'storm' when generator returns numbers divisible by 10" do
      allow( subject ).to receive( :generator ).and_return( 10 )
      expect( subject.today ).to eq( "storm" )
    end
    it "should return 'not storm' when generator returns numbers not divisible by 10" do
      allow( subject ).to receive( :generator ).and_return( 1 )
      expect( subject.today ).to eq( "not storm" )
    end
  end

end
