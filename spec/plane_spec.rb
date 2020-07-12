require 'spec_helper'
require_relative '../lib/plane'

describe Plane do
  it { is_expected.to be_an(Plane) }
  it 'Should either be flying or not' do
    expect(subject.flying).to eq(true).or(false)
  end
end
