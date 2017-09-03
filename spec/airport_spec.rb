require 'airport'
describe Airport do
  it 'has method land and takes on argument' do
    is_expected.to respond_to(:land).with(1).argument
  end
  it 'confirm plane has left airport' do
    plane = subject.takeoff
    expect(plane.in_airport?).to eq false
  end

end
