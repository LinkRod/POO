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
    tasks_list[task_done.to_i - 1].status = "true"
    completed = tasks_list[task_done.to_i - 1]
    completed_task = @model.complete(tasks_list, completed)
    @view.complete(completed_task)
  end
end


input = ARGV
Todo.new(input)

##############################################

#mvc-v.rb
class View

  def vista(tasks)
    #generar la lista de tareas con su estatus de completado
    tasks.each_with_index do |task, index|
      print "#{index + 1}. "#{task.name}""
      if task.status == "true"
        print "[ X ] "
      else 
        print "[   ] "
      end
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
      
      
Recorrer el mundo en bicicleta,false
Correr por el parque,false
Lanzarme en paracaidas,false
Esquiar en la nieve,false
Manejar una grua,false
Golpear a Donald Trump,false
Volar en un helicoptero,false
Aprender a nadar,false
