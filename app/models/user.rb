class User < ApplicationRecord

  def User.get_by(type, value)
    User.find_by_sql "SELECT id FROM users WHERE "+ type +" = '" + value + "'"
  end

end
