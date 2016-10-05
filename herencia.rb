class Vehicle
  attr_reader :color, :age

  def initialize
    @color
    @age = 0
  end

  def what_am_i?
      "I am #{self}"
    # Este método va a ser utilizado por varias clases y deberá regresar 
    # el nombre de la clase desde la cual se corrió.
    # ej.
    # bocho = Car.new
    # bocho.what_am_i? => Car
  end

  def number_of_wheels 
  end

  def age!
    @age = age
  end

end

class Motorized < Vehicle
  def has_motor
    true
  end

  def tank_size
  end

  def refuel
  end

  def number_of_gears
  end

end

class Motorbike < Motorized
  def to_s
  "Motorbike"
  end
end

class Car < Motorized
  def to_s
  "Car"
  end
end

class Bicycle < Vehicle
  def initialize(num)
    @age = num
  end
  def to_s
    "Bicycle"
  end
end

class Skateboard < Vehicle
  def to_s
    "Skateboard"
  end
end

moto = Motorbike.new
car = Car.new
bike = Bicycle.new(8)
skateboard = Skateboard.new

vehicles = [moto, car, bike, skateboard]


vehicles.each do |vehicle|
  vehicle.age!
  puts "#{vehicle.what_am_i?} responds to:"
  puts "\tNumber of wheels: #{vehicle.respond_to?(:number_of_wheels) == true}"
  puts "\tColor: #{vehicle.respond_to?(:color) == true}"
  puts "\tAge!: #{vehicle.respond_to?(:age!) == true}"
  puts "\tHas motor: #{vehicle.respond_to?(:has_motor) == true}"
  puts "\tTank size: #{vehicle.respond_to?(:tank_size) == true}"
  puts "\tRefuel: #{vehicle.respond_to?(:refuel) == true}"
  puts "\tNumber of gears: #{vehicle.respond_to?(:number_of_gears) == true}"
  puts "\tAge: #{vehicle.age}"
  puts "\n\n"
end
