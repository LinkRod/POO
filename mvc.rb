#mvc-m.rb
require 'csv'

class Task
  attr_accessor :name, :status

  def initialize(name, status = false)
    @name = name
    @status = status
  end
end



class RubyTodo

  def index
    arr = []
    CSV.foreach("todolist.csv") do |row|
      arr << Task.new(row[0],row[1])
    end
    arr
  end

  def add(adding)
    CSV.open("todolist.csv", "a+") do |csv|
      csv << [adding.name, adding.status]
    end
  end

  def delete(array, deleted)
    # arr = []
    # task_to_display = []
    # array_delete = []
    # CSV.foreach("todolist.csv") do |task|
    #     arr << Task.new(task[0], task[1])
    # end
    # arr.each_with_index do |task, index|
    #   if num.to_i != index + 1
    #     task_to_display << task
    #   #end 
    #   elsif num.to_i == index + 1
    #     array_delete << task.name
    #    end 
    # end
    CSV.open("todolist.csv", "wb") do |csv|
      array.each do |task|
        csv << [task.name, task.status]
      end
    end 
    deleted.name
  end

  def complete(array, completed)
    CSV.open("todolist.csv", "wb") do |task|
      array.each do |hecho|
        task << [hecho.name, hecho.status]
      end
    end
    completed.name
  end
end

##############################################

#mvc-c.rb
require_relative 'mvc-m.rb'
require_relative 'mvc-v.rb'


class Todo

  def initialize(argum)
    @model = RubyTodo.new
    @view = View.new
    menu(argum)
  end

  def menu(argum)
    task = argum[1..-1].join(" ")
    case argum[0]
    when "index" then indexcontrol
    when "add" then addcontrol(task)
    when "delete" then deletecontrol(task)
    when "complete" then completecontrol(task)
    end
  end

  def indexcontrol
    #leer info de csv
    tasks_list = @model.index
    #mostrar las tareas al user
    @view.vista(tasks_list)
  end

  def addcontrol(adding)
    new_task = Task.new(adding)
    @model.add(new_task)
    @view.add(adding)
  end

  def deletecontrol(num)
    tasks_list = @model.index
    deleted = tasks_list.delete_at(num.to_i - 1)
    deleting_task = @model.delete(tasks_list,deleted) 
    @view.delete(deleting_task)
  end

  def completecontrol(task_done)
    tasks_list = @model.index
    # completed = tasks_list(task_done)
    # completed_list = @model.complete(tasks_list, completed)
    @view.complete(task_done)
  end
end


input = ARGV
Todo.new(input)

##############################################

#mvc-v.rb
class View

  def vista(tasks)
    #generar la lista de tareas con su estatus de completado
    # status = []
    # tasks.each do |task|
    #   task.done == "true" ? status << "[ X ]" : status << "[   ]"
    tasks.each_with_index do |task, index|
      #p "#{index + 1}. #{task.name}"
      print "#{index + 1}. "#{task.name}""
      #print "#{status} "
      print "[   ] "
      p "#{task.name}"
    end
  end

  def add(string)
    p "Agregaste la tarea: '#{string}' a tu lista."
  end

  def delete(string)
    p "Eliminaste la tarea: '#{string}' de tu lista."
  end

  def complete(string)
    p "Completaste la tarea: '#{string}'."
  end

end


Golpear a Donald Trump,false
Dominar el mundo,false
Recorrer el mundo en bicicleta,false
Correr por el parque,false
Lanzarme en paracaidas,false
Esquiar en la nieve,false
Volar en helicoptero,false

# 1. [ ] "Golpear a Donald Trump"
# 2. [ ] "Convertirme en un Developer Rock Star"
# 3. [ ] "Dominar el mundo"
# 4. [ ] "Sacar la basura"
# 5. [ ] "Recorrer el mundo en bicicleta"
# 6. [ ] "Correr por el parque"
# 7. [ ] "Manejar una grua"
# 8. [ ] "Lanzarme en paracaidas"
# 9. [ ] "Aprender a usar un cañon"
