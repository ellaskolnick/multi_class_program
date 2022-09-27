require 'diary'

RSpec.describe Diary do
  context "when there are no diary entries" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.all).to eq []
    end

    it "returns nil" do
      diary = Diary.new
      expect(diary.read_perfect_amount(3, 5)).to eq nil
    end
  end
end
