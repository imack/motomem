Motomem::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
  end


  if Rails.env.development?
    mount DailyMailer::Preview => 'mail_view'
  end
end
