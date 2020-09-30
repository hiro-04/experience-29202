require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.build(:article, user_id: @user.id)
    @article.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '記事の保存ができる場合' do
    context "記事が保存できる場合" do
      it "必須項目を記入すると記事は保存される" do
        expect(@article).to be_valid
      end
    end

    context "記事が保存できない場合" do
      it "画像がないと商品は保存できない" do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("画像を入力してください")
      end
      it "タイトルが空だと保存できない" do
        @article.title = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("タイトルを入力してください")
      end
      it "記事内容が空だと保存できない" do
        @article.content = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("内容を入力してください")
      end
      it "カテゴリーが空だと保存できない" do
        @article.category_id = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "カテゴリーが１だと保存できない" do
        @article.category_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
    end
  end
end
