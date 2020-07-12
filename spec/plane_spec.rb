require 'spec_helper'
require_relative '../lib/plane'

describe Plane do
  it { is_expected.to be_an(Plane) }
  it { is_expected.to(respond_to :flying?) }
  it { is_expected.to(respond_to :land) }
  it { is_expected.to(respond_to :takeoff) }
  it 'Should either be flying or not' do
    expect(subject.flying).to eq(true).or(false)
    expect(subject.flying?).to eq(true).or(false)
  end
  it 'Can only #land when in flight' do
    expect{ Plane.new(false).land }.to raise_error("You are not in flight")
  end
  it 'Sets flying to false after landing' do
  expect(Plane.new(true).land).to eq(false)
  end
  it 'Can only #takeoff when not in flight' do
    expect{Plane.new(true).takeoff}.to raise_error("You are not grounded")
  end
  it 'Sets flying to true after takeoff' do
    expect(Plane.new(false).takeoff).to eq(true)
  end
end
