require 'airport'

describe Airport do
  it { is_expected.to respond_to :take_off }

  it 'instructs a plane to take off if the weather is NOT stormy' do
    plane = subject.take_off
    expect(plane).to eq "Plane has left the airport." if @weather == 'sunny'
  end

  it 'instructs the plane to delay take off if the weather is stormy' do
    plane = subject.take_off
    expect(plane).to eq "Flight delayed" if @weather == 'stormy'
  end

end