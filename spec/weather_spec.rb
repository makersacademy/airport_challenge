require 'spec_helper'
require 'weather'

describe 'Weather' do

let(:plane_class) { Class.new { include Weather } }
let(:plane) {plane_class.new}

  it "returns stormy weather when rand is greater than 0.7" do
    expect(plane.stormy?).to eq true
  end

end
