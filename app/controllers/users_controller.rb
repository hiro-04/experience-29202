class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end
end
