puts "Los argumentos recibidos son:"
ARGV.inspect

def argv_pig(word)
if word.chars[0].count("aeiou") == 1
   word + "way"
else
  num = word.chars.index{|x| x.count("aeiou") == 1}
  aux = word[num..word.size] + word[0..num-1] + "ay"
end
#aux
end
array = []
ARGV.each {|x| array << argv_pig(x)}
p array
