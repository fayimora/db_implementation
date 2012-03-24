require 'faker'
amount = 60


12.times do |i|
  name, phone_number = "Prof. "+Faker::Name.name, Faker::PhoneNumber.phone_number
  email = Faker::Internet.email(name)
  puts "INSERT INTO Lecturer VALUES( '#{i+1}', '#{name}', '#{email}', '#{phone_number}', TO_DATE('11-11-11', 'DD-MM-YY') );"
end

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