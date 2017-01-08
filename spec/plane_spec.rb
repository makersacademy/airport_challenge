require 'airport'

describe Plane do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new(@airport)
    @atc = AirTrafficController.new(@plane)
  end
  it 'is able to receive instruction to land' do
    expect(subject).to respond_to :clear_to_land?
    @atc.instruct_to_land(@plane, "Sunny")
    expect(@plane).to be_clear_to_land
  end
  it 'is not able to land if not cleared to' do
    @atc.instruct_to_take_off(@plane, "Sunny")
    @plane.take_off(@airport)
    expect { expect(@plane.land(@airport)) }.to raise_error "Not cleared for landing"
  end
  it 'is able to land' do
    expect(subject).to respond_to :land
    @atc.instruct_to_land(subject, "Sunny")
    expect(subject.land(@airport)).to be true
  end
  it 'is able to receive instruction to take off' do
    expect(subject).to respond_to :clear_for_take_off?
    @atc.instruct_to_take_off(@plane, "Sunny")
    expect(@plane).to be_clear_for_take_off
  end
  it 'is not able to take off if not cleared to' do
    expect { expect(subject.take_off(@airport)) }.to raise_error "Not cleared for takeoff"
  end
  it 'is able to take off' do
    expect(subject).to respond_to :take_off
    @atc.instruct_to_take_off(@plane, "Sunny")
    expect(@plane.take_off(@airport)).to be true
  end
end
