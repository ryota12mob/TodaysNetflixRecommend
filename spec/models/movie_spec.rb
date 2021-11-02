require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe do

    it "映画のタイトルがある場合は成功する" do
      movie = build(:movie)
      expect(movie).to be_valid
      expect(movie.errors).to be_empty
    end

    it "映画のタイトルがない場合には保存に失敗する" do
      movie_without_title = build(:movie, title: "")
      expect(movie_without_title).to be_invalid
      expect(movie_without_title.errors[:title]).to eq ["can't be blank"]
    end

    it "映画の画像がある場合は保存に成功する" do
      movie = build(:movie)
      expect(movie).to be_valid
      expect(movie.errors).to be_empty
    end

    it "映画の画像がない場合に保存に失敗する" do
      movie_without_image = build(:movie, image: "")
      expect(movie_without_image).to be_invalid
      expect(movie_without_image.errors[:image]).to eq ["can't be blank"]
    end
  end
end
