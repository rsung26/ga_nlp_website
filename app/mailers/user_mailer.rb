class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  #This is a custom method
  def welcome_user(user)
  	@user = user
  	@url = 'http://ga-nlp.herokuapp.com'
  	mail(to: @user.email, subject: "Email from GA-NLP App")
  end
  	# This is NOT a part of the mailer. Call it in a controller
	# UserMailer.welcome_user(user).deliver 
end
