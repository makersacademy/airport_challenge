require 'airport'

describe Airport do

  it { is_expected.to respond_to :take_off }

  it 'checks if plane has left the airport' do
    plane = subject.take_off
    expect(plane).to be_left_airport
  end

end
