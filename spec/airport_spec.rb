require "airport"
#require "plane"

describe Airport do

#  let (:plane) {double :plane}
describe "#land" do

  it "instructs a plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "instructs a plane to take_off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "doesn't allow planes to land when stormy" do
    weather = Weather.new

  end
  it 'raises an error if capacity is full' do
  subject.capacity.times { subject.dock(double(:bike)) }
  expect {subject.dock(double(:bike))}.to raise_error 'Docking station at full capacity'
  end

end



end
