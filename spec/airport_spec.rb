require 'airport'

describe Airport do
  it 'instruct a plan to land' do
    expect(subject).to respond_to :land
  end
end

describe Airport do
  it 'instruct a plan to take off' do
    expect(subject).to respond_to :take_off
  end

    it 'confirms no longer in the airport' do  
      expect(subject.take_off).to eq "Plane has left the airport"
    end

end
