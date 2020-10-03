class Planes
  attr_reader :status

  def take_off
    if @status == 'in air'
      puts "Error: #{self} is already in the air..."
    else
      @status = 'in air'
      puts "#{self} has taken off"
    end
  end

  def land
    if @status == 'landed'
      puts "Error: #{self} has already landed..."
    else
      @status = 'landed'
      puts "#{self} has landed"
    end
  end

  def confirm_status
  end
end
