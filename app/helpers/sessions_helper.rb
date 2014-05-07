module SessionsHelper
  $current_user
	
  def current_user=(user)
    $current_user = user
  end

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    $current_user
  end

  def sign_out
    $current_user = nil
    redirect_to "/signin"
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    puts "reaching sign_in sessions"
    $current_user = User.last
  end
  

	def signed_in?
  	!current_user.nil?
	end

end
