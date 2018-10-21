class VisitorsController < ApplicationController
  def index
    if  user_signed_in?
      @loggedin_user=current_user.name
    else
       @loggedin_user='none'
    end
  end
  
  def del_session_cookies
    #cookies.delete :user_name
    reset_session!
  end
end
