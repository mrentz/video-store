#needs rdoc comment
class UsersController < ApplicationController

def show
  # should be indented
@user = User.find(params[:id])
end

end
