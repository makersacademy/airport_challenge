require 'plane'

describe Plane do

  it {is_expected.to respond_to :taken_off }
  it 'reports status:takeoff when plane has taken off' do
    expect(subject.taken_off).to eq 'Taken-off, plane in air'
  end
  it {is_expected.to respond_to :landed}
  it "reports status:landed when plane has landed" do
    expect(subject.landed).to eq 'Plane landed!'
  end
end
