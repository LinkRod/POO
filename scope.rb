#Crea una variable en el global_scope llamada local_var con el valor "this is my local var" después crea un método llamado return_my_local_var, este método deberá regresar simplemente local_var. Has un puts del método return_my_local_var.
local_val = "this is my local var"

def return_my_local_var
  local_val
end

p return_my_local_var


#Para hacer las cosas más claras dentro del método return_my_local_var cambia el valor de la variable.
local_val = "this is my local var"

def return_my_local_var
  local_val = 10
end

p return_my_local_var


#Ahora encierra este código dentro de una clase llamada DummyClass, crea una instancia de esta clase y manda a llamar su método return_my_local_var y has un puts de lo que regresa. Que pasa?
class DummyClass

local_val = "this is my local var"

def return_my_local_var
  local_val = 10
end

end

p return_my_local_var

dummy1 = DummyClass.new
p dummy1.return_my_local_var



#Encierra la definición de local_var dentro del método initialize para que esta variable pertenezca a cada instancia creada. Recuerda que este método corre cada vez que se crea una nueva instancia. Que pasa ahora?
class DummyClass

def initialize
local_val = "this is my local var"
end

def return_my_local_var
  local_val = 10
end

end

p return_my_local_var

dummy1 = DummyClass.new
p dummy1.return_my_local_var




#Por ultimo convierte local_var en una variable de instancia llamada @instance_var.
class DummyClass

  def initialize
    local_var = @instance_var
  end

  def return_my_local_var
    @instance_var = 10
  end

end

#p return_my_local_var

dummy1 = DummyClass.new
p dummy1.return_my_local_var




$global_var = "This is a global variable"
CONSTANT = 3.1416
def global_var
  $global_var
end
def global_var=(new_var)
  $global_var = new_var
end
def constant
  CONSTANT
end

class DummyClass
  @@class_variable = "This is a class variable"
  def global_var
    $global_var
  end
  def global_var=(new_var)
    $global_var = new_var
  end
  def constant
    CONSTANT
  end
  def classvariable
    @@class_variable
  end
  def classvariable=(new_var)
    @@class_variable = new_var
  end
  def initialize
  end
  def return_my_local_var
  @instance_var
  end
  def return_my_local_var=(new_var)
    @instance_var = new_var
  end
end
dummy_1 = DummyClass.new
dummy_2 = DummyClass.new

puts dummy_1.classvariable="New value for the class variable"
puts dummy_2.classvariable
p constant
p global_var
p dummy_1.constant
p dummy_1.global_var
p dummy_1.global_var=("This is the NEW global variable")
p dummy_1.global_var
