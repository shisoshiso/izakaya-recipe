require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザーは新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # 未ログイン状態ではトップページに新規登録ページへ遷移するボタンが表示されていることを確認する
      expect(page).to have_content('無料会員登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する fill_inの第一引数は、id名
      # ラベルのforの値とinputのidの値が一致していることで、ブラウザ上に表示されている'ユーザー名'をフォームと認識して取得
      # ラベルが無いときや、forが無いときはidの値を入れることも可
      fill_in 'nickname', with: @user.nickname
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      # 新規登録ボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect { click_on('アカウントを作成する')}.to change { User.count }.by(1)
      # 保存されるとトップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # 新規登録ページやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('無料会員登録')
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('ゲストログイン')
    end
  end
end


RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない状態で新規投稿ページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit new_recipe_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # サインインページへ移動する
    visit root_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリックする
    click_on ('Log in')

    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path

  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # トップページに遷移する
    visit root_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'user_email',with: "aa@ss"
    fill_in 'user_password',with: "123456"

    # ログインボタンをクリックする
    click_on('Log in')

    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq new_user_session_path

  end
end