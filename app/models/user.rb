class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable

  def self.customers
   @user = User.first
   require 'net/http'
   source = @user.api_source
   resp = Net::HTTP.get_response(URI.parse(source))
   data = resp.body
   @result = JSON.parse(data)
  end
end
