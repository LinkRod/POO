puts "self es igual a: #{self}"
# self es igual a: main


class DummyClass
  puts "Esto esta corriendo cuando se define la clase"
  puts "En este contexto self es igual a: #{self}"
end
# Esto esta corriendo cuando se define la clase
# En este contexto self es igual a: DummyClass


class DummyClass

    def intance_method
        puts "Dentro de un método de instancia"
        puts "En este contexto self es igual a: #{self}"
    end
end

dummy_class = DummyClass.new()
puts dummy_class.intance_method
# En este contexto self es igual a: #<DummyClass:0x007fd8e39b0280>


class DummyClass

    def self.class_method
            puts "Dentro de un método de clase"
        puts "En este contexto self es igual a: #{self}"
    end
end

dummy_class = DummyClass.new()
puts DummyClass.class_method   
# Dentro de un método de clase
# En este contexto self es igual a: DummyClass