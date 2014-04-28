class UserSession < Authlogic::Session::Base
	def self.current_user_session 
    UserSession.find  
  end
  
  def self.current_user  
    UserSession.current_user_session && UserSession.current_user_session.record  
  end
end
