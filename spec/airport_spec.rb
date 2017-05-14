require 'airport'

describe Airport do
  it "Shows that Airport instances respond to the permission_to_land? method" do
    expect(subject).to respond_to :permission_to_land?
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
  it "responds to the show capacity method" do
    expect(subject).to respond_to :show_capacity
  end
  it "shows that by default the show capacity method will return 20" do
    expect(subject.show_capacity).to eq 20
  end
  it "Responds to a change capacity method" do
    expect(subject).to respond_to :change_capacity
  end
  it "Shows that show capacity method will return a different value when change capacity is caled with arguments" do
    subject.change_capacity(10)
    expect(subject.show_capacity).to eq 10
    subject.change_capacity(1)
    expect(subject.show_capacity).to eq 1
    subject.change_capacity(9_999_999)
    expect(subject.show_capacity).to eq 9_999_999
    subject.change_capacity(164)
    expect(subject.show_capacity).to eq 164
    subject.change_capacity(0)
    expect(subject.show_capacity).to eq 0
  end
  it "Shows that instances of Airport respond to the check_number_of_grounded_planes method" do
    expect(subject).to respond_to :check_number_of_grounded_planes
  end
  it "shows that instances of Aiport will respond to allow_airplane_to_land method" do
    expect(subject).to respond_to :allow_airplane_to_land
  end
  it "Shows that by default check_number_of_grounded_planes will return 0" do
    expect(subject.check_number_of_grounded_planes).to eq 0
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
  it "Shows that instances of Airport respond to permission_to_take_off? method" do
    expect(subject).to respond_to :permission_to_take_off?
  end
  let(:weather) {double(:weather)}
  it "Shows that permission_to_take_off? returns a value of true if check_current_wether == sunny" do
    subject.instance_variable_set("@weather", double(:weather, check_current_weather_condition: "sunny"))
    expect(subject.permission_to_take_off?).to eq true
    subject.instance_variable_set("@weather", double(:weather, check_current_weather_condition: "stormy"))
    expect(subject.permission_to_take_off?).to eq false
  end
  # it "allow_airplane_to_take_off raises an error if permission_to_land? is false" do
  #   subject.stub(:permission_to_land?) { false }
  #   expect { subject.allow_airplane_to_land }.to raise_error 'Permission to land denied'
  # end
end
