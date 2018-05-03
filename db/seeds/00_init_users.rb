puts "Run in 00_init_users.rb"

if 0 == Group.count
  group_names = ["admin", "normal"]
  group_names.each do |name|
    Group.create(name: name)
  end
else
  puts "Groups had been created."
end

if 0 == Account.count
  admin_account = {name: "崔毅", email: "cuiyi.plus@gmail.com", password: "cuiyi", is_active: true, group_names: ["admin"]}
  account = Account.create(admin_account)
else
  puts "Admin account had been created."
end