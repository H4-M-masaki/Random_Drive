class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?





     def after_sign_in_path_for(resource)
       if user_signed_in?
        public_user_path(@user.id)# ログイン後に遷移するpathを設定
       else admin_signed_in?
        admin_users_path
       end
     end

     def after_sign_out_path_for(resource)
       if resource == :user
         root_path
       elsif resource == :admin
         new_admin_session_path
       else
         root_path
       end
     end




protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end

end
