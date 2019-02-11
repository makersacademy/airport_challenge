require "airport"
require "airplane"

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = Airplane.new
    allow(@airport).to receive(:weather_check) { 1 }
  end

  it 'exits' do
    Airport.new
  end

  it 'can land a plane' do
    expect(@airport).to respond_to(:land)
  end

  it 'creates a plane when a plane is landed' do
    expect(@airport.land(@plane)).to eq([@plane])
  end

  it 'shows the landed plane is present' do
    @airport.land
    expect(@airport.hangar).not_to be_empty
  end

  it 'airport allows planes to takeoff' do
    @airport.land(@plane)
    expect(@airport.takeoff).to eq(@plane)
  end

  it 'airplane is no longer in the airport after take off' do
    @airport.land(@plane)
    @airport.takeoff
    expect(@airport.hangar).to be_empty
  end

  it 'does not allow a plane to land if full' do
    5.times { @airport.land }
    expect { @airport.land }.to raise_error("The airport is full!")
  end

  context "When weather is Stormy" do

    before(:each) do
      allow(@airport).to receive(:weather_check) { fail "Cannot fly due to poor weather!" }
    end

    it 'does not allow a plane to take off if the weather is "stormy"' do
      expect { @airport.takeoff }.to raise_error("Cannot fly due to poor weather!")
    end

    it 'does not allow a plane to land if the weather is "stormy"' do
      expect { @airport.land }.to raise_error("Cannot fly due to poor weather!")
    end

  end

end
