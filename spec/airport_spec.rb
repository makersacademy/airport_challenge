require 'airport'

describe Airport do
  it { is_expected.to respond_to :instruct_land }
  it { expect(subject).to respond_to(:instruct_land).with(1).argument }
  it { is_expected.to respond_to :instruct_takeoff }
  it { expect(subject).to respond_to(:instruct_takeoff).with(1).argument }
  it { is_expected.to respond_to :confirm_gone }
  it { expect(subject).to respond_to(:confirm_gone).with(1).argument }

  it 'instructs a plane to land' do
    heathrow = Airport.new
    airbus = Plane.new
    expect(heathrow.instruct_land(airbus)).to eq(airbus) 
  end

  it 'instructs a plane to take-off' do
    heathrow = Airport.new
    airbus = Plane.new
    expect(heathrow.instruct_takeoff(airbus)).to eq(airbus) 
  end

end
