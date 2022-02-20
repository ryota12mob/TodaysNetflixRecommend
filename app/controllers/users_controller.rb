class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to welcome_path
            flash[:notice] = '会員登録が完了しました。'
        else
            flash.now[:alert] = 'ユーザーの作成に失敗しました'
            render :new
        end

    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
