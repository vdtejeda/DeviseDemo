class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

 # If you are going to deploy the app on Heroku, create a Procfile in the root of your project and add
 # worker: rake jobs:work
  # one worker process to handle the jobs will cost you about $35 per month:
  # heroku ps:scale worker=1
end
