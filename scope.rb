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

