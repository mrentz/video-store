# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#            user_password PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#        user_registration PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                          POST   /users(.:format)               devise/registrations#create
#                     root GET    /                              static_pages#home
#                     user GET    /users/:id(.:format)           users#show
#                     help GET    /help(.:format)                static_pages#help
#                    about GET    /about(.:format)               static_pages#about
#                  contact GET    /contact(.:format)             static_pages#contact
#                   videos GET    /videos(.:format)              videos#index
#                          POST   /videos(.:format)              videos#create
#                new_video GET    /videos/new(.:format)          videos#new
#               edit_video GET    /videos/:id/edit(.:format)     videos#edit
#                    video GET    /videos/:id(.:format)          videos#show
#                          PATCH  /videos/:id(.:format)          videos#update
#                          PUT    /videos/:id(.:format)          videos#update
#                          DELETE /videos/:id(.:format)          videos#destroy
#

Rails.application.routes.draw do

  devise_for :users

  root 'static_pages#home'

  ##
  # I've noticed that along with the no user permissions level there is no back end system to this site, you should be making \
  # use of a admin namespace routes setup and the pure admin gem to create an 'admin' version of the site where records can easily
  # be view and create/updated in a useful, user-friendly way that would only be accessible by users with the create permissions.
  # if you don't have access contact Daniel:
  # https://github.com/blaknite/pure-admin-rails
  #

  resources :users, only: [:show]

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  resources :videos

end
