require 'plane.rb'

describe Plane do

  it { is_expected.to respond_to :status? }

  it 'reports when it has taken off' do
    expect(subject.status?).to eq "Taken off"
  end

  # it 'reports when it has landed' do
  #
  # end

end
