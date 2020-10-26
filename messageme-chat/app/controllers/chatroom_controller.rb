class ChatroomController < ApplicationController
 before_action :require_user

  def index
    @message =Massage.new
    @messages=Massage.all
    
  end
 
end
