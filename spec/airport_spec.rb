require 'airport'

RSpec.describe Airport do
  subject(:airport) { described_class.new(20)}

  it "allows you to change capacity" do 
    subject = Airport.new(10)
    10.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport has reached capacity therefore you cannot land'
  end

  it 'does not allow planes to land when capacity is reached' do
    20.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport has reached capacity therefore you cannot land'
  end

  describe '#land' do
  it 'instructs plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end 
end

  describe '#take_off' do 
    it 'instructs plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end 
    it 'confirms plane is no longer at the airport' do 
      expect(subject.take_off(Plane.new)).to eq 'Plane has left the airport'
    end
  end

end
