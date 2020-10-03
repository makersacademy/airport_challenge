class Planes
  attr_reader :status

  def take_off
    @status = 'in air'
    puts "#{self} has taken off"
  end

  def land
    @status = 'landed'
    puts "#{self} has landed"
  end

  def confirm_status
  end
end
