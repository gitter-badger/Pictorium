user = User.new(email: "tesdt@test.jp", password: "pictorium")
user.save!
user.userinfo = Userinfo.new(user_name: "name", profile: "desc")