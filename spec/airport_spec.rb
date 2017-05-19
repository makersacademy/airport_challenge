require 'airport'

describe Airport do
  describe '#current_capacity' do
    before(:each) { @airport = described_class.new }
    it "shows current_capacity is set to 20 by default" do
      expect(@airport.current_capacity).to eq 20
    end
    it "Shows that current_capacity can be changed" do
      @airport.current_capacity = 19
      expect(@airport.current_capacity).to eq 19
    end
  end
  describe '#at_capacity?' do
    before(:each) { @airport = described_class.new }
    it "Shows that at_capacity? will return true if the number of grounded planes is the same as current_capacity" do
      @airport.stub(:check_number_of_grounded_planes) { 20 }
      expect(@airport.at_capacity?).to eq true
    end
    it "Shows that at_capacity? will return false if the number of grounded planes is less that current_capacity" do
      @airport.stub(:check_number_of_grounded_planes) { 19 }
      expect(@airport.at_capacity?).to eq false
    end
  end
  describe '#instruct_airplane_to_land' do
    it "instruct_airplane_to_land raises an error unless it is sunny" do
      airport = described_class.new(20, double(:weather, sunny?: false))
      expect { airport.instruct_airplane_to_land }.to raise_error 'Permission to land denied'
    end
    it "instruct_airplane_to_land raises an error if at_capacity? is true" do
      airport = described_class.new
      airport.stub(:at_capacity?) { true }
      expect { airport.instruct_airplane_to_land }.to raise_error 'Permission to land denied'
    end
  end
  describe '#instruct_airplane_to_take_off' do
    it "instruct_airplane_to_take_off raises an error unless it is sunny" do
      airport = described_class.new(20, double(:weather, sunny?: false))
      expect { airport.instruct_airplane_to_take_off }.to raise_error 'Permission to take off denied'
    end
  end
  describe '#show_status_of_airplanes' do
    before(:each) do
      @airport = described_class.new(20, double(:weather, sunny?: true))
      10.times { @airport.instruct_airplane_to_land }
    end
    it "Shows that instructing a plane to land will increases Grounded count by 1" do
      @airport.instruct_airplane_to_land
      expect(@airport.show_status_of_airplanes).to eq "Grounded: 11, Airborne: 0"
    end
    it "Shows that instructing a plane to take_off will decreases Grounded count by 1" do
      @airport.instruct_airplane_to_take_off
      expect(@airport.show_status_of_airplanes).to eq "Grounded: 9, Airborne: 1"
    end
  end
end
