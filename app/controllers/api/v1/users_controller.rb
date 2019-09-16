class UsersController < ApplicationController
  respond_to(:json)

  def show
    respond_with(User.find[:id])
  end
end
