require 'Plane'
describe Plane do
  it "Responds to flying? method" do
    expect(subject).to respond_to :flying?
  end
end
