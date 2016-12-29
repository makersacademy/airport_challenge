require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'should respond to a method called landed?' do
    expect(plane).to respond_to (:landed?)
  end

  it 'should respond to a method called taken_off?' do
    expect(plane).to respond_to (:taken_off?)
  end

  it 'should be able to report that it has landed' do
    expect(plane).to respond_to (:report_landing)
  end

  it 'should be able to report that it has taken off' do
    expect(plane).to respond_to (:report_take_off)
  end

  it "a plane that has not taken should return false for taken_off?" do
    expect(plane.taken_off?).to eq false
  end

end
