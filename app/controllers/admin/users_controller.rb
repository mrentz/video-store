##
# Controller for {User}
class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  layout 'admin'
  respond_to :html

  def index
    @title = 'Users'
    @users = apply_scopes(@users)

    respond_with(@users) do |format|
      format.html do
        @users = @users.page(params[:page])
        render partial: 'admin/users/table' if request.xhr?
      end
    end
  end

  def show
    @title = @user
    respond_with(@user) do |format|
      format.html do
        render partial: 'admin/users/show' if request.xhr?
      end
    end
  end

  def new
    @title = 'New User'
  end

  def create
    respond_to do |format|
      if @user.save
        format.html do
          redirect_to @user, notice: 'User was successfully created.'
        end
      else
        format.html do
          @title = 'New User'
          render action: :new
        end
      end
    end
  end

  def edit
    @title = "Edit #{@user}"
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to @user, notice: 'User was successfully updated.'
        end
      else
        format.html do
          @title = "Edit #{@user}"
          render action: :edit
        end
      end
    end
  end

  def destroy
    # Place your destroy logic here
  end

  private

    def user_params
      params.require(:user).permit()
    end
end
