class User < ActiveRecord::Base

  # Get user's fullname
  def fullname
    "#{first_name} #{last_name}"
  end
end
