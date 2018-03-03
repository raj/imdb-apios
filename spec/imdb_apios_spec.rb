RSpec.describe ImdbApios do

  before(:each) do
    @client = ImdbApios::Client.new
  end


  # it "has a version number" do
  #   expect(ImdbApios::VERSION).not_to be nil
  # end

  # it "don't valid non imdb id" do
  #   expect(ImdbApios::validate_imdb_id("not a valid imdb id")).not_to be true
  #   expect(ImdbApios::validate_imdb_id("ttt1832382")).not_to be true
  # end

  # it "validate good movie imdb id" do
  #   expect(ImdbApios::validate_imdb_id("tt1832382")).to be true
  # end

  # it "validate good people imdb id" do
  #   expect(ImdbApios::validate_imdb_id("nm0001129")).to be true
  # end

  # it "get title plot synopsis" do
  #   expected_keys = ['@type', 'id', 'plotSynopses', 'title', 'titleType', 'year']
  #   resource = @client.get_title_plot_synopsis('tt0111161')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title plot" do
  #   expected_keys = ['@type', 'outline', 'summaries', 'totalSummaries']
  #   resource = @client.get_title_plot('tt0111161')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title user reviews" do
  #   expected_keys = ['@type', 'base', 'paginationKey', 'reviews', 'totalReviews']
  #   resource = @client.get_title_user_reviews('tt0111161')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title metacritics reviews" do
  #   expected_keys = [
  #       '@type', 'id', 'metaScore', 'metacriticUrl', 'reviewCount',
  #       'userRatingCount', 'userScore', 'reviews', 'title'
  #   ]
  #   resource = @client.get_title_metacritic_reviews('tt0111161')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "raise error for non existent title" do
  #   expect {@client.get_title_user_reviews('tt9999999')}.to raise_error(StandardError)
  # end


  # it "check if title exist" do
  #   result = @client.title_exists?('tt2322441')
  #   expect(result).to be true 
  # end

  # it "check if title doesn't exist" do 
  #   result = @client.title_exists?('tt0000000')
  #   expect(result).to be false 
  # end


  # it "search suggest" do 
  #   results = @client.search('Baazigar')
  #   result_count =  results['d'].length
  #   expect(result_count).to be >= 0
  # end

  # it "search title with special chars" do 
  #   [
  #     'Mission: Impossible',
  #     'Honey, I Shrunk the Kids',
  #     '4.3.2.1. (2010)',
  #     '500 Days of Summer (2009)',
  #     '$9.99 (2008)',
  #     'Goonies 1986',
  #     '[REC] (2007)',
  #     '[REC]² (2009)',
  #     '[REC]³ Genesis (2012)',
  #     '¡Three Amigos! (1986)',
  #     '(Untitled) (2009)',
  #   ].each do |title|
  #     results = @client.search(title)
  #     result_count =  results['d'].length
  #     expect(result_count).to be >= 0
  #   end
      
  # end
  
  # it "search for name" do 
  #   results = @client.search('Sridevi')
  #   result_count =  results['d'].length
  #   expect(result_count).to be >= 0
  # end


  # it "search for title with no result" do
  #   results = @client.search('898582da396c93d5589e0')
  #   has_result =  results.keys.include?("d")
  #   expect(has_result).to be false
  # end

  # it "get popular titles" do
  #   expected_keys = ['@type', 'id', 'ranks']
  #   resource = @client.get_popular_titles()
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get popular shows" do
  #   expected_keys = ['@type', 'id', 'ranks']
  #   resource = @client.get_popular_shows()
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get name" do
  #   expected_keys = [
  #     '@type', 'base', 'id', 'jobs', 'knownFor', 'quotes',
  #     'trivia'
  #   ]
  #   resource = @client.get_name('nm0000151')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get name filmography" do
  #   expected_keys = ['@type', 'filmography']
  #   resource = @client.get_name_filmography('nm0000151')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "get title" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = [
  #       '@type', 'base', 'filmingLocations', 'metacriticScore', 'plot',
  #       'ratings', 'similarities', 'soundtrack'
  #   ]

  #   resource = @client.get_title(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "get title genres" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = ['@type', 'genres', 'id', 'title', 'titleType', 'year']

  #   resource = @client.get_title_genres(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title similarities" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = ['@type', 'base', 'id', 'similarities']

  #   resource = @client.get_title_similarities(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title awards" do 
  #   imdb_id = 'tt0111161'
  #   expected_keys = ['@type', 'awards', 'id']

  #   resource = @client.get_title_awards(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title releases" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = ['@type', 'releases', 'id', 'title', 'titleType', 'year']

  #   resource = @client.get_title_releases(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "get title versions" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = [
  #       '@type', 'alternateTitles', 'alternateVersions', 'colorations',
  #       'defaultTitle', 'silent', 'spokenLanguages', 'originalTitle',
  #       'origins', 'runningTimes', 'id', 'title', 'titleType', 'year'
  #   ]

  #   resource = @client.get_title_versions(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title ratings" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = [
  #       '@type', 'id', 'title', 'titleType', 'year', 'bottomRank',
  #       'canRate', 'rating', 'ratingCount', 'topRank'
  #   ]

  #   resource = @client.get_title_ratings(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "get title quotes" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = ['@type', 'quotes', 'id', 'title', 'titleType', 'year']

  #   resource = @client.get_title_quotes(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "get title connections" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = ['@type', 'base', 'connections']

  #   resource = @client.get_title_connections(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title credits" do
  #   imdb_id = 'tt0111161'
  #   expected_keys = ['@type', 'base', 'creditsSummary', 'id', 'credits']

  #   resource = @client.get_title_credits(imdb_id)
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title credits with redirection" do
  #   redir_imdb_id = 'tt0000021'  
  #   @client.get_title_credits(redir_imdb_id)
  #   expect(true).to be true # TODO : fix this
  # end

  # it "get title with redirection" do
  #   redir_imdb_id = 'tt0000021'  
  #   @client.get_title(redir_imdb_id)
  #   expect(true).to be true # TODO : fix this
  # end

  # it "get title excludes episodes" do
  #   episode_imdb_id = 'tt3181538'
  #   # assert @client.get_title(episode_imdb_id).size > 0
  #   # @client(exclude_episode: true).get_title(episode_imdb_id) nil
  #   # ~raise error
  #   expect(true).to be true # TODO : fix this
  # end


  # it "get title episode" do 
  #   episode_imdb_id = 'tt3181538'
  #   expect(true).to be true # TODO : fix this
  # end

  # it "get title episodes of a non show" do
  #   non_show_imdb_id = 'tt0468569'
  #   @client.get_title_episodes(non_show_imdb_id)
  #   # ~raise error
  #   expect(true).to be true # TODO : fix this
  # end

  # it "get name images" do
  #   expected_keys = ['@type', 'images', 'totalImageCount']
  #   resource = @client.get_name_images('nm0000032')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get name videos" do
  #   expected_keys = [
  #       '@type', 'akas', 'id', 'image', 'legacyNameText', 'name', 'size',
  #       'videoCounts', 'videos'
  #   ]

  #   resource = @client.get_name_videos('nm0000032')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "get title images" do
  #   expected_keys = ['@type', 'images', 'totalImageCount']

  #   resource = @client.get_title_images('tt0111161')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title videos" do
  #   expected_keys = [
  #       '@type', 'id', 'image', 'size', 'title', 'titleType', 'videoCounts',
  #       'videos', 'year'
  #   ]

  #   resource = @client.get_title_videos('tt0111161')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title plot taglines" do
  #   expected_keys = [
  #       '@type', 'id', 'image', 'nextEpisode', 'numberOfEpisodes',
  #       'runningTimeInMinutes', 'seriesEndYear', 'seriesStartYear', 'taglines',
  #       'title', 'titleType', 'year'
  #   ]

  #   resource = @client.get_title_plot_taglines('tt0303461')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title news" do
  #   expected_keys = [
  #       '@type', 'id', 'image', 'items', 'label', 'paginationKey', 'title',
  #       'titleType', 'year'
  #   ]

  #   resource = @client.get_title_news('tt0303461')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "get title trivia" do
  #   expected_keys = ['@type', 'spoilt', 'unspoilt', 'id']
  #   resource = @client.get_title_trivia('tt0303461')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end


  # it "get title soundtracks" do
  #   expected_keys = ['@type', 'base', 'soundtracks']
  #   resource = @client.get_title_soundtracks('tt0303461')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title goofs" do 
  #   expected_keys = ['@type', 'goofs', 'base']
  #   resource = @client.get_title_goofs('tt0303461')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title technical" do
  #   expected_keys = [
  #       '@type', 'aspectRatios', 'cameras', 'colorations', 'id', 'labs',
  #       'negativeFormats', 'printedFormats', 'processes', 'soundMixes',
  #       'title', 'titleType', 'year'
  #   ]

  #   resource = @client.get_title_technical('tt0303461')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "get title companies" do
  #   expected_keys = [
  #       'specialEffects', 'miscellaneous', 'id', 'production', 'distribution',
  #       '@type'
  #   ]

  #   resource = @client.get_title_companies('tt0303461')
  #   expect(resource.keys.sort).to eq expected_keys.sort
  # end

  # it "raise error if title not found" do
  #   @client.get_title('tt9999999')
  #   # ~raise error
  #   expect(true).to be true # TODO : fix this
  # end



  
end
