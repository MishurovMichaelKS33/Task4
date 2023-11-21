def generate_rome(num)
  rome_mas = [
    ["","I","II","III","IV","V","VI","VII","VIII","IX"],
    ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"],
    ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"],
    ["","M","MM","MMM"]
  ]
  res = ""
  (0..3).each do |i|
    j = (num/(10**i))%10
    res = "#{rome_mas[i][j]}#{res}"
  end
  res
end

def generate_arabic(num)
  num = num.upcase.strip
  rome_mas = [
    ["","I","II","III","IV","V","VI","VII","VIII","IX"],
    ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"],
    ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"],
    ["","M","MM","MMM"]
  ]
  res = 0
  order = [9,8,7,6,4,5,3,2,1]
  (0..3).each do |i|
    order.each do |j|
      if rome_mas[i][j] and num.include? rome_mas[i][j]
        num.sub! rome_mas[i][j], ""
        res += (10**i)*j
        break
      end
    end
  end
  res
end

if __FILE__ == $0
  loop do
    puts "Enter arabic num to convert"
    num = gets.chomp.to_i
    if num < 1 or num >= 4000
      puts "Wrong num"
      exit!
    end
    puts "Result:"
    puts generate_rome num

    puts "Enter rome num to convert"
    num = gets.chomp
    puts "Result:"
    puts generate_arabic num
    puts "Enter anything to continue or 'exit'"
    text = gets.chomp
    break if text == "exit"
  end
end
