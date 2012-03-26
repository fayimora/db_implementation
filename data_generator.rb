require 'faker'
amount = 60


def question
  100.times do |i|
    question = "What is " + Faker::Company.name
    puts "INSERT INTO Question VALUES('#{i+1}', '#{question}' );"
  end
end
question() 



def lecturer
    12.times do |i|
    name, phone_number = "Prof. "+Faker::Name.name, Faker::PhoneNumber.phone_number
    email = Faker::Internet.email(name)
    address = Faker::Address.secondary_address + " " + Faker::Address.street_address
    puts "INSERT INTO Lecturer VALUES( '#{i+1}', '#{name}', '#{email}', TO_DATE('11-11-11', 'DD-MM-YY'), '#{phone_number}', '#{address}' );"
  end
end

# lecturer()

def student
  amount.times do |i|
    name, email, phone_number = Faker::Name.name, Faker::Internet.email(name), Faker::PhoneNumber.phone_number
    address, stu_num = Faker::Address.secondary_address + " " + Faker::Address.street_address, Faker::Address.zip_code[0..4]
    year, ss =0, amount/3
    if(i <=ss) then year = 1 end
    if(i>=ss+1 && i<=ss*2) then year = 2 end
    if(i>=ss*2) then year = 3 end
    puts "INSERT INTO Student VALUES( '#{stu_num}', '#{name}', TO_DATE('11-11-11', 'DD-MM-YY'), '#{year}', '#{email}', '#{phone_number}', '#{address}' ); "
  end
end


def method_name
  first_yr_students = [77658,37885,62597,66354,44274,72767,69846,56725,20761,64582,96163,15499,51567,68957,53580,86578,91502,87787,12294,66074]
second_yr_students = [43215,17158,73355,71268,11142,98716,19092,97297,92559,15354,73773,76935,22854,77473,29004,94849,64874,40438,18343,46123]
third_yr_students = [19231,23293,40484,44739,76965,37879,77478,47540,62345,46017,17591,21402,21744,60443,46983,58961,42727,60984,10630,73701]

first_yr_modules = [DCS111,DCS100,DCS113,DCS103,DCS104,DCS129]
second_yr_modules =[DCS200,DCS210,DCS225,DCS235,DCS224,ELE404]
third_yr_modules = [DCS360,DCS339,DCS310,DCS337,DCS041,DCS306]

# first_yr_students
j=0
20.times do |i|
  6.times do |variable|
    puts " INSERT INTO StudentSubjects VALUES( ' " + first_yr_students[i] + "'," +  first_yr_modules[j] + ") "
  end 
end

end