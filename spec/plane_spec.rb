require 'plane.rb'

describe Plane do

it { is_expected.to respond_to(:land) }

it { is_expected.to respond_to(:land).with(1).argument }


end