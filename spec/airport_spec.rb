require 'airport'
  (let :plane) {double :plane}
describe Airport do
  it "docks planes" do
    subject.dock(plane)
  end

end
