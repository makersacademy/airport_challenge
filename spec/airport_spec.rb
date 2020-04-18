require 'airport'

RSpec.describe Airport do

  it 'instructs plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end 

  it 'instructs plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end 

  describe '#take_off' do 
    it 'confirms plane is no longer at the airport' do 
      expect(subject.take_off(Plane.new)).to eq 'Plane has left the airport'
    end
  end

end
