require "airport"
require "plane"
require "weather"

describe Airport do

  let( :plane1 ){ double :plane1 }
  let( :plane2 ){ double :plane2 }

  describe "capacity" do
    it "should be overridden as appropriate" do
      allow( subject ).to receive( :default_capacity ){ 0 }
      expect( subject.default_capacity ).to eq 0
    end
  end

  describe "#land" do
    it { is_expected.to respond_to :land }
    it "should return truthy answer when plane lands" do
      allow( subject ).to receive( :check_weather ){ "not stormy" }
      expect( subject.land( plane1 ) ).to be_truthy
    end
    it "should not accept landing when the plane is already at the airport" do
      allow( subject ).to receive( :check_weather ){ "not stormy" }
      subject.land( plane1 )
      expect( subject.land( plane1 ) ).to be_falsy
    end
    it "should not accept landing when weather is stormy" do
      allow( subject ).to receive( :check_weather ){ "stormy" }
      expect{ subject.land( plane1 ) }.to raise_error( "Due to bad weather, aircraft are unable to land." )
    end
    it "should accept landing when weather is not stormy" do
      allow( subject ).to receive( :check_weather ){ "not stormy" }
      expect( subject.land( plane1 ) ).to be_truthy
    end
    it "should not accept landing when airport is full" do
      airport = Airport.new
      allow( airport ).to receive( :check_weather ){ "not stormy" }
      allow( airport ).to receive( :default_capacity ){ 0 }
      expect{ airport.land( plane1 ) }.to raise_error( "Airport at full capacity, no space available." )
    end
  end

  describe "#confirm_landed" do
    it { is_expected.to respond_to :confirm_landed }
    it "should return truthy answer when plane has landed" do
      allow( subject ).to receive( :check_weather ){ "not stormy" }
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
      allow( subject ).to receive( :check_weather ){ "not stormy" }
      subject.land( plane1 )
      expect( subject.take_off(plane1) ). to be_truthy
    end
    it "should return error when the plane hasn't landed before taking off" do
      allow( subject ).to receive( :check_weather ){ "not stormy" }
      subject.land( plane1 )
      expect{ subject.take_off( plane2 ) }.to raise_error( "This plane hasn't landed at this airport!" )
    end
    it "should not exist the plane at airport after taking off" do
      allow( subject ).to receive( :check_weather ){ "not stormy" }
      subject.land( plane1 )
      subject.take_off( plane1 )
      expect( subject.confirm_landed( plane1 ) ).to be_falsy
    end
    it "should not accept takeoff when weather is stormy" do
      allow( subject ).to receive( :check_weather ){ "not stormy" }
      subject.land( plane1 )
      allow( subject ).to receive( :check_weather ){ "stormy" }
      expect{ subject.take_off( plane1 ) }.to raise_error( "Due to bad weather, all flights are grounded." )
    end
    it "should accept takeoff when weather is not stormy" do
      allow( subject ).to receive( :check_weather ){ "not stormy" }
      subject.land( plane1 )
      expect( subject.take_off( plane1 ) ).to eq plane1
    end
  end

  describe "#check_weather" do
    it { is_expected.to respond_to :check_weather }
    it "should return truthy answer when check the weather" do
      expect( subject.check_weather ).to be_truthy
    end
    it "should return 'not stormy' when the weather is not stormy" do
      allow( Weather ).to receive_message_chain( :new, :today ).and_return( "not stormy" )
      expect( subject.check_weather ).to eq( "not stormy" )
    end
    it "should return 'stormy' when the weather is stormy" do
      allow( Weather ).to receive_message_chain( :new, :today ).and_return( "stormy" )
      expect( subject.check_weather ).to eq( "stormy" )
    end
  end

end
