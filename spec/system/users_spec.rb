require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザーが新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができる' do
      #トップページに移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with:@user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'first-name', with: @user.first_name
      fill_in 'family-name', with: @user.family_name
      fill_in 'first-name-kana', with: @user.first_name_kana
      fill_in 'family-name-kana', with: @user.family_name_kana
      find("#user_birthday_1i").find("option[value='2000']").select_option
      find("#user_birthday_2i").find("option[value='1']").select_option
      find("#user_birthday_3i").find("option[value='1']").select_option
      #サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      #トップページへ遷移する
      expect(current_path).to eq root_path
      #　サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザーが新規登録できないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページに戻ってくる' do
      #トップページに移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'nickname', with: ""
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      fill_in 'password-confirmation', with: ""
      fill_in 'first-name', with: ""
      fill_in 'family-name', with: ""
      fill_in 'first-name-kana', with: ""
      fill_in 'family-name-kana', with: ""
      find("#user_birthday_1i").find("option[value='']").select_option
      find("#user_birthday_2i").find("option[value='']").select_option
      find("#user_birthday_3i").find("option[value='']").select_option
      #サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      #新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      #トップページに移動する
      visit root_path
      #トップページにログインページへ遷移するボタンがあるか確認する
      expect(page).to have_content('ログイン')
      #ログインページに遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      #ログインボタンを押す
      find('input[name="commit"]').click
      #トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      #サインアップページへ遷移するボタンやログインページに遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
    context 'ログインができないとき' do
      it '保存されているユーザーの情報と合致しないとログインができない' do
        #トップページに移動する
        visit root_path
        #トップページにログインページへ遷移するボタンがあるか確認する
        expect(page).to have_content('ログイン')
        #ログインページに遷移する
        visit new_user_session_path
        # ユーザー情報を入力する
        fill_in 'email', with: ""
        fill_in 'password', with: ""
        #ログインボタンを押す
        find('input[name="commit"]').click
        #ログインページへ戻されることを確認する
        expect(current_path).to eq new_user_session_path
      end
    end
end
