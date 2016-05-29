require 'spec_helper.rb'
require 'airport'

feature 'A new airport can be created with a specific or default capacity' do

  scenario 'An airport is created with default capacity' do
    expect{ Airport.new }.not_to raise_error
  end

  scenario 'An airport is created with a specific capacity' do
    expect{ Airport.new(77) }.not_to raise_error
  end
end
