require 'airport'

class FakeAeroplane

end

describe Airport do

  let(:subject)   {Airport.new}

  it 'allows a plane to land in the airport' do
    plane = FakeAeroplane.new
    expect(subject.land(plane)).to eq plane
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
end
