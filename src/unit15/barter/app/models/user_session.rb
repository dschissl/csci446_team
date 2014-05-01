class UserSession < Authlogic::Session::Base
	def self.current_user_session 
    UserSession.find
  end
  
  def self.current_user  
    return UserSession.current_user_session.record if UserSession.current_user_session
    return nil
  end
end
