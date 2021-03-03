require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'create of recipe' do
    before do
      @recipe = FactoryBot.build(:recipe)
    end

    context 'recipeが保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@recipe).to be_valid
      end
      it 'pointは空でも保存できること' do
        @recipe.point = nil
        expect(@recipe).to be_valid
      end
    end

    context 'recipeが保存できない場合' do
      it 'imageが空では保存できないこと' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では保存できないこと' do
        @recipe.name = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Name can't be blank")
      end
      it 'materialが空では保存できないこと' do
        @recipe.material = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Material can't be blank")
      end
      it 'explanationが空では保存できないこと' do
        @recipe.explanation = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'alcoholが空では保存できないこと' do
        @recipe.alcohol_id = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Alcohol can't be blank")
      end
      it 'alcoholが---では保存できないこと' do
        @recipe.alcohol_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('Alcohol を選択してください')
      end
      it 'categoryが空では保存できないこと' do
        @recipe.category_id = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Category can't be blank")
      end
      it 'categoryが---では保存できないこと' do
        @recipe.category_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('Category を選択してください')
      end
      it 'genreが空では保存できないこと' do
        @recipe.genre_id = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Genre can't be blank")
      end
      it 'genreが---では保存できないこと' do
        @recipe.genre_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('Genre を選択してください')
      end
      it 'userが紐付いていないと保存できないこと' do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('User must exist')
      end
    end
  end
end
