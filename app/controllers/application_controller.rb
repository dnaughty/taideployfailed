class ApplicationController < ActionController::Base
	include Pundit::Authorization
	protect_from_forgery with: :exception

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


	private

		def user_not_authorized
			flash[:notice] = "Sorry, You are not authorized to do this"
			redirect_to(request.referrer) || root_path
		end


		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
		end
end
