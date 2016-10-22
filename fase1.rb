# CLASES
#Crear una clase CreditCard que tenga como datos la información que aparece en la tabla de ejemplo. Posteriormente crea un arreglo con cinco objetos de tarjetas de crédito e imprime la información de cada tarjeta en una tabla. Utiliza las pruebas y la tabla que se presenta de ejemplo.
#Clase CreditCard
class CreditCard
  attr_accessor :name, :number, :expiration, :cvc, :status

#Cinco instancias de CreditCard
  def initialize(name, number, expiration, cvc, status)
    @name = name
    @number = number
    @expiration = expiration
    @cvc = cvc
    @status = status
  end
end

#Array con cinco objetos de tarjetas de crédito
  datos = [["Amex", 2345673444, "12/15", 2345, [234, 567, 456, 567, 344]],
          ["ScotiaBank", 2345673744, "12/16", 2845, [234, 345, 456, 567, 344]],
          ["Bancomer", 2345673444, "12/15", 2645, [234, 345, 456, 567, 344]],
          ["Serfin", 2345473454, "12/20", 1345, [234, 345, 456, 567, 344]],
          ["BanCoppel", 2345373464, "12/18", 2445, [567, 345, 456, 567, 344]]]

  cards = []

  datos.each do |x| 
    cards << CreditCard.new(x[0], x[1], x[2], x[3], x[4])
  end

#tests --
  cards.each do |card|
    puts "#{card.name} responds to:"
    puts "\tName: #{card.respond_to?(:name) == true}"
    puts "\tNumber: #{card.respond_to?(:number) == true}"
    puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
    puts "\tcvc: #{card.respond_to?(:cvc) == true}"
    puts "\tGet status: #{card.respond_to?(:status) == true}"
    puts "\tSet status: #{card.respond_to?(:status=) == true}"
    puts "\n\n"
  end

#método para mostrar datos de tarjetas
  def datos(cards)
    print "\n"
    print "|     name     |     number     |    expiration  |      cvc      |           status          |\n"
    print "--------------------------------------------------------------------------------------------------------\n"
    cards.each do |card|
    print "|     #{card.name}     |   #{card.number}   |      #{card.expiration}     |      #{card.cvc}     | #{card.status} |\n"
    end
    print "\n"
  end
datos(cards)






# HERENCIA
#Crea las clases Athlete, Runner, Swimmer y Cyclist, trata de relacionarlas a través de herencia. Cada atleta podrá incrementar el total de la distancia recorrida y el tiempo total de ejercicio. Al final cada tipo de atleta deberá mostrar la distancia total recorrida, el tiempo total y la velocidad obtenida. Es importante considerar los casos cuando la distancia recorrida es igual a 0 y mayor que 0. Todas las pruebas deberán pasar.
class Athlete
  attr_accessor :total_distance, :total_time

  def initialize(total_distance = 0, total_time = 0)
    @total_distance = total_distance
    @total_time = total_time
    @max_speed = 0
  end

  #método para validar tiempo
  def speed_record(speed)
    @max_speed = speed if speed > @max_speed
  end

  #método para hacer ejercicio
  def new_workout(distancia, tiempo)
    @total_distance = distancia
    @total_time = tiempo
  end

  #método para obtener velocidad del atleta
  def speed
    speed = @total_time > 0 ? (@total_distance/@total_time.to_f).round(2) : 0
    speed
  end

end

#Runner class
class Runner < Athlete
  def run
    "Ran #{@total_distance} meters, time: #{@total_time} seconds, speed: #{speed} m/s"
  end
end

#Swimmer class
class Swimmer < Athlete
  def swim
    "Swam #{@total_distance} meters, time: #{@total_time} seconds, speed: #{speed} m/s"
  end
end

#Cyclist class
class Cyclist < Athlete
  def ride_bike
    "Ride #{@total_distance} meters, time: #{@total_time} seconds, speed: #{speed} m/s"
  end
end


#tests

#instancias de atletas con distancia en metros --
runner = Runner.new()
swimmer = Swimmer.new(50, 10)
cyclist = Cyclist.new(70, 27)

athletes = [runner, swimmer, cyclist]

athletes.each do |athlete|
  #¿qué tipo de atleta es? --
  puts "\n"
  puts "#{athlete.class} responds to:"
  puts "\tAthlete speed: #{athlete.respond_to?(:speed) == true}"
  puts "\tGet Athlete time: #{athlete.respond_to?(:total_time) == true}"
  puts "\tSet Athlete time: #{athlete.respond_to?(:total_time=) == true}"
  puts "\tSpeed record: #{athlete.respond_to?(:speed_record) == true}"
  puts "\tGet Distance: #{athlete.respond_to?(:total_distance) == true}"
  puts "\tSet Distance: #{athlete.respond_to?(:total_distance=) == true}"
  puts "\trun method: #{athlete.respond_to?(:run) == true}" if athlete == runner
  puts "\tswim method: #{athlete.respond_to?(:swim) == true}" if athlete == swimmer
  puts "\tride_bike method: #{athlete.respond_to?(:ride_bike) == true}" if athlete == cyclist
  puts "\n\n"
end

#test for runner

#test para runner con distancia = 0 --
p runner.run == "Ran 0 meters, time: 0 seconds, speed: 0 m/s"

#test para runner al hacer ejercicio, incrementa distancia = 20 metros y tiempo = 7 segundos --
runner.new_workout(20, 7) 

#test para runner con distancia = 20 metros y tiempo = 7 segundos --
p runner.run == "Ran 20 meters, time: 7 seconds, speed: 2.86 m/s"

#test para swimmer con distancia = 50 --
p swimmer.swim == "Swam 50 meters, time: 10 seconds, speed: 5.0 m/s"






# RACE CARS 
# En una pista de carrera se realizan ciertas pruebas de velocidad a diferentes race cars. Se necesita medir para cada carro la velocidad promedio de acuerdo a cinco laptimes registrados. El lapdistance de la pista es de 100 metros. Esta distancia es importante que la consideres constante en el programa.
# Es necesario crear una clase RaceCar que contemple el nombre del carro y los tiempos de cada lap que ha registrado. Hay que considerar un método que retorne la velocidad promedio de cada carro, otro método que muestre el nivel de cada carro dependiendo de su velocidad (Principiante, Normal, Medio, Avanzado). Posteriormente, crear una clase Team que permita formar equipos de carros. Por último, crear un método que permita buscar si existe un determinado carro en un equipo. Todas las pruebas deben pasar.
# Extra - Crea un metodo en team que regrese el promedio de velocidad del equipo.
# Extra - Genera una tabla que muestre el coche y su nivel.
#RaceCar class
class RaceCar
    attr_reader :name

  def initialize(name)
    @name = name
  end


  #método para obtener velocidad promedio
  def average_speed

  end

  #método que muestra nivel de cada race car
  def level

  end

end

#Team class
class Team 
  attr_accessor :team

  def initialize(team = [])
    @team = team
  end

  #método para agregar nuevo race car
  def new_racecar(car)
    @team << car
  end

  #método para calcular promedio de velocidad del equipo
  def average_speed_of_team

  end

end

#método para buscar race car
def search_racecar(name,team)


end

#método para generar la tabla
def
  
end

#método para mostrar nombre y nivel del race car
def ()
    print "\n"
    print "|    Name        |    Nivel        |\n"
    print "---------------------------------------------------\n"
    .each do ||
    print "|     #{.name}     |   #{.level}   |\n"
    end
    print "\n"
  end


#instancias de RaceCar
...


#tests--
p "car1: #{car1.average_speed} m/s"
#ej. car1: 9.5 m/s
p "car2: #{car2.average_speed} m/s"
#ej. car2: 12.01 m/s
p "car3: #{car3.average_speed} m/s"
#ej. car3: 10.65 m/s
p "car4: #{car4.average_speed} m/s"
#ej. car4: 11.0 m/s
p "car5: #{car5.average_speed} m/s"
#ej. car5: 10.15 m/s
p "car6: #{car6.average_speed} m/s"
#ej. car6: 15.51 m/s

#create a team of cars --
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)

#test para buscar race car en equipo team_one --
p search("Power", team_one) == "Power is a racer"

#calculate average speed of team --
p team_one.average_speed_of_team
#ej. 10.66 

#método para mostrar nombre y nivel del race car
