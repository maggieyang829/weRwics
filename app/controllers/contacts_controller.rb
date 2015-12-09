class ContactsController < ApplicationController
  before_action :set_user
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to(@user, :notice => "Thank you for contacting me.")
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end


  
end