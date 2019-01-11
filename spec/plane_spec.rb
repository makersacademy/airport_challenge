# to do
# refactor to only allow grounded or airborne as status options
# only allow iniialize airport to be an airport
# force requiring an initial airport value if start grounded
# make code such if create plane airbone aiport = nil
#

require 'plane'


describe Plane do
  let (:airport) {double(:plane_landing => true, :is_a? => true, :plane_entering_on_ground => true, :plane_taking_off => true)}
  let(:plane_created_on_ground) {Plane.new('grounded',airport)}
  let(:plane_created_in_air) {Plane.new('airborne')}

  it "can enter system in air or on ground" do
    expect(Plane.new('grounded', airport).status).to eq 'grounded'
    expect(Plane.new('airborne').status).to eq 'airborne'
    expect(Plane.new('grounded',airport).current_airport).to eq airport
  end

  it "can't have a current_airport if ariborne" do
    expect{Plane.new('airborne', airport)}.to raise_error "can't be in airport if airborne"
  end

  it "correctly tells the aiport it is landing" do
    expect(airport).to receive(:plane_landing).with(kind_of(Plane))
    plane_created_in_air.land(airport)
  end

  it "correctly tells airports when it is enterring on ground" do
    expect(airport).to receive(:plane_entering_on_ground).with(kind_of(Plane))
    plane_created_on_ground
  end

  it "tells airport when taking off" do
    expect(airport).to receive(:plane_taking_off).with(kind_of(Plane))
    plane_created_on_ground.take_off
  end

  it "can take off" do
    expect(plane_created_on_ground.take_off.status).to eq "airborne"
    expect(plane_created_on_ground.current_airport).to eq nil
    expect {plane_created_on_ground.take_off}.to raise_error "plane is already airborne"
  end

  it "can land" do
    expect(plane_created_in_air.land(airport).status).to eq 'grounded'
    expect{plane_created_on_ground.land(airport)}.to raise_error "plane is already grounded"
    expect(plane_created_in_air.current_airport).to eq airport
  end

end
