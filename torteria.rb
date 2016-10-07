class Torta
  attr_accessor :tipo, :estado

  def initialize(tipo)
    @tipo = tipo
    @estado = "Crudo"
    p "Torta de #{@tipo}"
  end

  def state(est)
    index = est.index(@estado)
    if @estado != "Quemado"
    @estado = est[index + 1]
    end
  end

  def to_s
    "Sale torta de #{@tipo} está en estado #{@estado}"
  end

end

class Horno
  attr_accessor :tortas_finales

  def initialize
    @tortas_finales = []
    @estados = ["Crudo", "Casi listo", "Listo", "Quemado"]
  end

  def add_torta(torta)
      @tortas_finales << torta
  end

  def start_oven
    @tortas_finales.each{|torta| torta.state(@estados)}
  end

  def torta_lista?
    num = 0
    @tortas_finales.each{|torta| num += 1 if torta.estado == "Listo"}
    num
  end 

  def obtain_torta
    array = []
    @tortas_finales.each{|torta| arre << torta if torta.estado == "Listo"}
    @tortas_finales.delete_if{|torta| torta.estado == "Listo"}
    array
  end
end


tortas_finales = ["Jamón", "Queso", "Huevo", "Hawaiana", "Milanesa", "Norteña"]
hornear = Horno.new
p "Horno listo"
p "Se meten cuatro tortas al horno"
for i in 0..3
hornear.add_torta(Torta.new(tortas_finales[rand(4)]))
end
hornear.start_oven
p "Nueva orden"
p hornear.obtain_torta
p "Se preparan 4 tortas y se meten al horno:"
for i in 0..3
hornear.add_torta(Torta.new(tortas_finales[rand(4)]))
end

p "Fin del ciclo"
p "Tortas totales:"
p hornear.tortas_finales
