def password
  @password ||= BCrypt::Password.new(hashed_password)
end

def password=(new_password)
  @password = BCrypt::Password.create(new_password)
  self.hashed_password = @password
end

def self.authenticate(username, password)
  user = User.find_by(username: username)
  (user && user.password == password) ? user : nil
end