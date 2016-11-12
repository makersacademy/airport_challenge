require "airport"
require "plane"
require "weather"

describe Airport do

  let( :plane1 ){ double :plane1 }
  let( :plane2 ){ double :plane2 }

  describe "#land" do
    it { is_expected.to respond_to :land }
    it "should return truthy answer when plane lands" do
      expect( subject.land( plane1 ) ).to be_truthy
    end
  end

  describe "#confirm_landed" do
    it { is_expected.to respond_to :confirm_landed }
    it "should return truthy answer when plane has landed" do
      subject.land( plane1 )
      expect( subject.confirm_landed(plane1) ).to be_truthy
    end
    it "should return falsy answer when plane hasn't landed" do
      expect( subject.confirm_landed( plane1 ) ).to be_falsy
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to :take_off }
    it "should return truthy answer when plane takes off" do
      subject.land( plane1 )
      allow( subject ).to receive( :check_weather ){ "not storm" }
      expect( subject.take_off(plane1) ). to be_truthy
    end
    it "should return error when the plane hasn't landed before taking off" do
      subject.land( plane1 )
      allow( subject ).to receive( :check_weather ){ "not storm" }
      expect{ subject.take_off( plane2 ) }.to raise_error( "This plane hasn't landed at this airport!" )
    end
    it "should not exist the plane at airport after taking off" do
      subject.land( plane1 )
      allow( subject ).to receive( :check_weather ){ "not storm" }
      subject.take_off( plane1 )
      expect( subject.confirm_landed( plane1 ) ).to be_falsy
    end
    it "should not accept takeoff when weather is storm" do
      subject.land( plane1 )
      allow( subject ).to receive( :check_weather ){ "storm" }
      expect{ subject.take_off( plane1 ) }.to raise_error( "Due to bad weather, all flights are grounded." )
    end
    it "should accept takeoff when weather is not storm" do
      subject.land( plane1 )
      allow( subject ).to receive( :check_weather ){ "not storm" }
      expect( subject.take_off( plane1 ) ).to eq plane1
    end
  end

  describe "#check_weather" do
    it { is_expected.to respond_to :check_weather }
    it "should return truthy answer when check the weather" do
      expect( subject.check_weather ).to be_truthy
    end
    it "should return 'not storm' when the weather is not storm" do
      allow( Weather ).to receive_message_chain( :new, :today ).and_return( "not storm" )
      expect( subject.check_weather ).to eq( "not storm" )
    end
    it "should return 'storm' when the weather is storm" do
      allow( Weather ).to receive_message_chain( :new, :today ).and_return( "storm" )
      expect( subject.check_weather ).to eq( "storm" )
    end
  end

end
