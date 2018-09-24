class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable

  def self.customers
   @user = User.first
   require 'net/http'
   api_source ="https://aura-system.herokuapp.com/api/customers?api_token=qA88bHyQ1ydBxhxNsEyK"
   source = @user.api_source
   resp = Net::HTTP.get_response(URI.parse(source))
   data = resp.body
   @result = JSON.parse(data)
  end

  def self.consumer_nos
    User.customers.collect {|x| x["consumer_no"]}.sort
  end

end
