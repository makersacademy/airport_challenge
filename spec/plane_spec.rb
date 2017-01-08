require 'airport'

describe Plane do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new(@airport)
    @atc = AirTrafficController.new(@plane)
  end
  it 'is able to receive instruction to land' do
    expect(subject).to respond_to :clear_to_land?
    @atc.instruct_to_land
    expect(@plane).to be_clear_to_land
  end
  it 'is able to land' do
    expect(subject).to respond_to :land
    expect(subject.land(@airport)).to be true
  end
  it 'is able to receive instruction to take off' do
    expect(subject).to respond_to :clear_for_take_off?
    @atc.instruct_to_take_off
    expect(@plane).to be_clear_for_take_off
  end
  it 'is able to take off' do
    expect(subject).to respond_to :take_off
    @atc.instruct_to_take_off
    expect(subject.take_off(@airport)).to be true
  end
end
