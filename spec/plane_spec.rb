require 'plane'

describe Plane do
  it {is_expected.to respond_to (:flying?)}

  it 'status changes to not flying after plane has landed at an airport' do
    subject.landplane
    expect(subject.flying?).to eq false
  end



end
