module ControllerHelpers
  def sign_in(user_auth = double('user_auth'))
    if user_auth.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
      allow(controller).to receive(current_user_auth).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user_auth)
      allow(controller).to receive(current_user_auth).and_return(user_auth)
    end
  end
end