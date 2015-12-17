class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      profiles_show_path
    end


end
