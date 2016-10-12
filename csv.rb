require 'csv'
require 'faker'


class Person
  attr_accessor :first_name, :last_name, :email, :phone, :created_at

  def initialize(first_name, last_name, email, phone, created_at)
    @first_name = first_name 
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end

  def to_a
    [@first_name, @last_name, @email, @phone, @created_at]
  end

end

def generator_people(num)
    array = []
    for i in 1..num
    array << Person.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::PhoneNumber.cell_phone, Time.now)
    end
    array
end 


class PersonWriter
  def initialize(file, list)
    @file = file
    @list = list
  end

  def create_csv
    CSV.open(@file, "wb") do |csv|
    #CSV.open(@file, "a+") do |csv| => Es para modificar la base ya creada
       @list.each do |people|
         csv << [people.first_name, people.last_name, people.email, people.phone, people.created_at]
       end
    end
  end
end


class PersonParser
  def initialize(file)
    @file = file
  end

  def read_csv
    arr = []
    CSV.foreach(@file) do |row|
    arr << Person.new(row[0],row[1],row[2],row[3],row[4])
    end
    arr
  end
end


class Modify
  def initialize(read_csv)
    @read_csv = read_csv
  end

  def modificar
    p "Coloque el nombre cuyo correo desea modificar:"
    search_name = gets.chomp
    p "Cual es el nuevo correo?"
    new_email = gets.chomp
    arr = []
    CSV.foreach(@read_csv) do |row|
      arr << Person.new(row[0],row[1],row[2],row[3],row[4])
    end
    arr.each do |x|
      if search_name == x.first_name
        x.email = new_email
        p "El correo ha sido modificado satisfactoriamente"
      end
    end
    CSV.open(@read_csv, "wb") do |csv|
       arr.each do |people|
         csv << [people.first_name, people.last_name, people.email, people.phone, people.created_at]
       end
    end
  end
end

people = generator_people(10)

# ---Esto es para crear la base con datos aleatorios---
# person_writer = PersonWriter.new("people.csv", people)
# person_writer.create_csv

parser = PersonParser.new('people.csv')
people = parser.read_csv

for i in 0..9
  p people[i].to_a
end

modif = Modify.new("people.csv")
modif.modificar



# people.scv
Kennedi,Breitenberg,lilly@doyle.com,(353) 548-7310,2016-10-07 20:30:58 -0500
Shawna,Marvin,leora@toy.org,1-155-038-0015,2016-10-07 20:30:58 -0500
Lourdes,Ortiz,niko@hoegerreynolds.name,344.943.4624,2016-10-07 20:30:58 -0500
Blaze,Renner,pete.king@little.name,918.280.1406,2016-10-07 20:30:58 -0500
Rafaela,Mante,rafgo@haha.com,663.937.2836,2016-10-07 20:30:58 -0500
Tatyana,Koelpin,brook@hodkiewicz.io,198.194.9657,2016-10-07 20:30:58 -0500
Elta,OHara,landen_rolfson@volkman.info,937.562.0594,2016-10-07 20:30:58 -0500
Keagan,Satterfield,daron@effertz.net,(879) 194-4999,2016-10-07 20:30:58 -0500
Gordon,Funk,gor-don@gmail.com,841.006.0368,2016-10-07 20:30:58 -0500
Diana,Nicolas,dianita@joenn.com,859.860.3714,2016-10-07 20:30:58 -0500
