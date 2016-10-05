# Herencia (Inheritance) es la relacion entre clases y superclases y lo que heredan de las clases en la jerarquia mas arriba.
p "Herencia"
class Vehicle
  def has_wheels?
    true
  end
end

class Car < Vehicle
end
car1 = Car.new
p car1.has_wheels? == true



# Composicion (Composition) es parecido al de herencia. La diferencia radica en que las clases no son parientes, sino que una se compone de la otra.
# Esto nos permite controlar los metodos que no queremos que sean heredados
p "Composicion"
class Vehicle
  def has_wheels?
    true
  end
end

class Car 
  def initialize
    @car = Vehicle.new
  end
  def has_wheels?
    @car.has_wheels?
  end
end

car2 = Car.new
p car2.has_wheels? == true



#Encapsular la funcion con los datos que esta modificando, controlando, así, los datos que no queremos que sean publicos. 
p "Encapsulado"
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name= (new_name)
    @name = new_name
  end
end

person1 = Person.new("Pedro")
p person1.name == "Pedro"
person1.name = ("Pablo")
p person1.name == "Pablo"



p "Duck Typing"
#Los objetos son definidos por los metodos que pueden realizar y no por el nombre del objeto en si.
class Duck  
  def quack  
    'Quack!'  
  end  
  
  def swim  
    'Paddle paddle paddle...'  
  end  
end  
  
class Goose  
  def honk  
    'Honk!'  
  end  
  def swim  
    'Splash splash splash...'  
  end  
end  
  
class DuckRecording  
  def quack  
    play  
end  
  
  def play  
    'Quack!'  
  end  
end  
  
def make_it_quack(duck)  
  duck.quack  
end  
puts make_it_quack(Duck.new)  
puts make_it_quack(DuckRecording.new)  
  
def make_it_swim(duck)  
  duck.swim  
end  
puts make_it_swim(Duck.new)  
puts make_it_swim(Goose.new)  



p "Ley de Demeter"
#Evitar el uso de metodos en objetos que son resultados de otros metodos.
class Wallet
  attr_accessor :cash
  def withdraw(amount)
     raise InsufficientFundsError if amount > cash
     cash -= amount
     amount
  end
end
class Customer
   attr_accessor:wallet
  # behavior delegation
  def pay(amount)
    @wallet.withdraw(amount)
  end
end
class Paperboy
  def collect_money(customer, due_amount)
    @collected_amount += customer.pay(due_amount)
  end
end



p "Overriding methods"
#Podemos elegir entre usar el metodo de la super clase, usar nuestro propio metodo en la sub clase, o complementar el metetodo del a super clase.

class People
  def initialize(nombre)
    @nombre=nombre
  end
  def to_s
    "mi nombre es #{@nombre}"
  end
end
class Alumno < People
  def initialize(nombre,materia)
    super(nombre)
    @materia=materia
  end
  def to_s
    super + " y mi materia es #{@materia}"
  end
end

persona = People.new("Juan")
p persona.to_s
alum = Alumno.new("Juan","Matematicas")
p alum.to_s



p "Modulos"
#Los modulos son grupos de metodos, clases y constantes que facilitan ciertas funciones

require 'Prime'
p Prime.first(10) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]



p "Scope"
# Es elrango o alcance que tienen las variables en un programa determinado
$variable_global="valiable_global"
Constante="constante"
class Pruebas
  @@variable_de_clase="variable_de_clase"
  attr_accessor :varibale_instancia
  def initialize
    @varibale_instancia="varibale_instancia"
  end
end



p "Polymorphism"
#Polymorphism es el concepto de modificar la herencia de una superclase directo en la subclase
class People
  def initialize(nombre)
    @nombre=nombre
  end
  def to_s
    "mi nombre es #{@nombre}"
  end
  def self.breath?
    true
  end
end
class Alumno < People
  def initialize(nombre,materia)
    super(nombre)
    @materia=materia
  end
  def to_s
    super + " y mi materia es #{@materia}"
  end
end

persona = People.new("Juan")
p persona.to_s
alum = Alumno.new("Juan","Matematicas")
p alum.to_s
p People.breath?



p "Separation of Concerns"
#Es el concepto de dividir responsabilidades para que cada metodo sea responsable de una funcion solamente
  def suma(calis)
    suma = 0
    calis.each{|cal| suma += cal}
    suma
  end 
def promedio(calis,num)
    suma = suma(calis)
    promedio = suma/num
end
p promedio([5,6,7,8,7,6,5,9,10],9)
