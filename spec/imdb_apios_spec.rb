RSpec.describe ImdbApios do
  it "has a version number" do
    expect(ImdbApios::VERSION).not_to be nil
  end

  it "don't valid non imdb id" do
    expect(ImdbApios::validate_imdb_id("not a valid imdb id")).not_to be true
    expect(ImdbApios::validate_imdb_id("ttt1832382")).not_to be true
  end

  it "validate good movie imdb id" do
    expect(ImdbApios::validate_imdb_id("tt1832382")).to be true
  end

  it "validate good people imdb id" do
    expect(ImdbApios::validate_imdb_id("nm0001129")).to be true
  end

  

  
end
