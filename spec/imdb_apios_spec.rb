RSpec.describe ImdbApios do
  it "has a version number" do
    expect(ImdbApios::VERSION).not_to be nil
  end

  it "don't valid non imdb id" do
    ImdbApios::validate_imdb_id("not a valid imdb id") ==  false
  end

  it "validate good movie imdb id" do
    ImdbApios::validate_imdb_id("tt1832382") == true
  end


  it "validate good people imdb id" do
    ImdbApios::validate_imdb_id("nm0001129") == true
  end

  
end
