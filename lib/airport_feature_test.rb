require_relative 'airport'
require_relative 'plane'
require_relative 'weather'

puts 'Please enter the capacity for the new airport (Integers values only)'
capacity = gets.chomp
new_airport = Airport.new(capacity)
docked_planes=[]
begin
  puts 'What would you like to do? : (l)and, (t)ake_off or e(x)it'
  input = gets.chomp.downcase
  while input != 'x'
    if input == 'l'
      puts 'Please enter flight number'
      plane = gets.chomp
      plane.land
    elsif input == 't'
      puts 'Please enter flight number'
      plane = gets.chomp
      plane.take_off
    elsif input == 'x'
      puts 'Goodbye!'
    else
      puts 'Please enter a valid response'
    end
    puts 'What would you like to do? : (l)and, (t)ake_off or e(x)it'
    input = gets.chomp.downcase
  end
rescue
  puts 'Operation failed, goodbye :('
end
