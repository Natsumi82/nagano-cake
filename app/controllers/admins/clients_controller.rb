class Admins::ClientsController < ApplicationController
   before_action :authenticate_admin!
  def show
    @client = Client.with_deleted.find(params[:id])
  end

  def index
    @clients = Client.with_deleted.page(params[:page]).per(10)
  end

  def edit
    @client = Client.with_deleted.find(params[:id])
  end

  def update
    @client = Client.with_deleted.find(params[:id])
    if @client.update(client_params)
      flash[:success] = '個人情報を編集しました'
      redirect_to admins_client_path(@client)
    else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postal_code, :street_address, :deleted_at)
  end
end
