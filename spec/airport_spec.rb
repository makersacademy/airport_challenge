require 'airport'

describe Airport do
  it "Shows that Airport instances respond to the permission_to_land? method" do
    expect(subject).to respond_to :permission_to_land?
  end
  it "Shows that instances of Airport repond to the at_capacity? method" do
    expect(subject).to respond_to :at_capacity?
  end
  it "Shows that at_capacity? will return true if the number of grounded planes is the same as current_capacity" do
    # subject.instance_variable_set("@current_capacity", 20)
    subject.current_capacity = 20
    subject.stub(:check_number_of_grounded_planes) { 20 }
    expect(subject.at_capacity?).to eq true
    subject.stub(:check_number_of_grounded_planes) { 99 }
    expect(subject.at_capacity?).to eq true
    subject.stub(:check_number_of_grounded_planes) { 19 }
    expect(subject.at_capacity?).to eq false
    subject.stub(:check_number_of_grounded_planes) { 0 }
    expect(subject.at_capacity?).to eq false
  end
  it "Shows that permission_to_land will return true if the weather is sunny and airport is not at capacity or false if it is stormy or airport is at capacity" do
    subject.instance_variable_set("@weather", double(:weather, check_current_weather_condition: "sunny"))
    subject.stub(:at_capacity?) { false }
    expect(subject.permission_to_land?).to eq true
    subject.instance_variable_set("@weather", double(:weather, check_current_weather_condition: "sunny"))
    subject.stub(:at_capacity?) { true }
    expect(subject.permission_to_land?).to eq false
    subject.instance_variable_set("@weather", double(:weather, check_current_weather_condition: "stormy"))
    subject.stub(:at_capacity?) { false }
    expect(subject.permission_to_land?).to eq false
    subject.instance_variable_set("@weather", double(:weather, check_current_weather_condition: "stormy"))
    subject.stub(:at_capacity?) { true }
    expect(subject.permission_to_land?).to eq false
  end
  it "responds to current_capacity attr_accessor and that by default it is 20" do
    expect(subject.current_capacity).to eq 20
  end
  it "Shows that current_capacity can be changed with the attr_accessor" do
    expect(subject.current_capacity).to eq 20
    subject.current_capacity = 19
    expect(subject.current_capacity).to eq 19
    subject.current_capacity = 0
    expect(subject.current_capacity).to eq 0
    subject.current_capacity = 999
    expect(subject.current_capacity).to eq 999
  end
  it "shows that instances of Aiport will respond to allow_airplane_to_land method" do
    expect(subject).to respond_to :allow_airplane_to_land
  end
  it "allow_airplane_to_land raises an error if permission_to_land? is false" do
    subject.stub(:permission_to_land?) { false }
    expect { subject.allow_airplane_to_land }.to raise_error 'Permission to land denied'
  end
  # it "Shows that using the allow_airplane_to_land method will increases the check_number_of_grounded_planes return value by 1" do
  #   subject.allow_airplane_to_land
  #   expect(subject.check_number_of_grounded_planes).to eq 1
  # end
  it "Shows that instances of airport respond to show_status_of_airplanes method" do
    expect(subject).to respond_to :show_status_of_airplanes
  end
  it "Shows that instances of Airport respond to allow_airplane_to_take_off method" do
    expect(subject).to respond_to :allow_airplane_to_take_off
  end
  it "Shows that allow_airplane_to_take_off method reduces the number of grounded planes and increases airborne planes by one" do
    subject.stub(:permission_to_land?) { true }
    subject.stub(:permission_to_take_off?) { true }
    20.times { subject.allow_airplane_to_land }
    expect(subject.show_status_of_airplanes).to eq "Grounded: 20, Airborne: 0"
    subject.allow_airplane_to_take_off
    expect(subject.show_status_of_airplanes).to eq "Grounded: 19, Airborne: 1"
  end
  it "Shows that instances of Airport respond to permission_to_take_off? method" do
    expect(subject).to respond_to :permission_to_take_off?
  end
  it "Shows that permission_to_take_off? returns a value of true if check_current_wether == sunny" do
    subject.instance_variable_set("@weather", double(:weather, check_current_weather_condition: "sunny"))
    expect(subject.permission_to_take_off?).to eq true
    subject.instance_variable_set("@weather", double(:weather, check_current_weather_condition: "stormy"))
    expect(subject.permission_to_take_off?).to eq false
  end
  it "allow_airplane_to_take_off raises an error if permission_to_take_off? is false" do
    subject.stub(:permission_to_take_off?) { false }
    expect { subject.allow_airplane_to_take_off }.to raise_error 'Permission to take off denied'
  end
end
