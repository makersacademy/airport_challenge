require 'airport'
require 'plane'
require 'spec_helper'
require 'weather'

describe Airport do
  it { should respond_to(:take_off).with(1).argument }
  it { should respond_to(:land).with(1).argument }
  it { should respond_to(:weather_good?) }

end
