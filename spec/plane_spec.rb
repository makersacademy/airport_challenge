require 'spec_helper'
require 'plane'

describe Plane do
  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it { is_expected.to respond_to(:land).with(1).argument }

end
