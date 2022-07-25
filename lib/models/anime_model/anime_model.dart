class AnimeList {
  int? id;
  String? title;
  String? mediaType;
  double? mean;
  int? numScoringUsers;
  String? status;
  int? numEpisodes;
  String? startDate;
  String? endDate;
  String? source;
  int? numListUsers;
  int? popularity;
  int? numFavorites;
  int? rank;
  String? averageEpisodeDuration;
  String? rating;
  int? startSeasonYear;
  String? startSeasonSeason;
  String? broadcastDayOfTheWeek;
  String? broadcastStartTime;
  String? genres;
  String? studios;
  String? synopsis;
  String? nsfw;
  String? createdAt;
  String? updatedAt;
  String? mainPictureMedium;
  String? mainPictureLarge;
  String? alternativeTitlesEn;
  String? alternativeTitlesJa;
  String? alternativeTitlesSynonyms;

  // AnimeList(
  //     {this.id,
  //       this.title,
  //       this.mediaType,
  //       this.mean,
  //       this.numScoringUsers,
  //       this.status,
  //       this.numEpisodes,
  //       this.startDate,
  //       this.endDate,
  //       this.source,
  //       this.numListUsers,
  //       this.popularity,
  //       this.numFavorites,
  //       this.rank,
  //       this.averageEpisodeDuration,
  //       this.rating,
  //       this.startSeasonYear,
  //       this.startSeasonSeason,
  //       this.broadcastDayOfTheWeek,
  //       this.broadcastStartTime,
  //       this.genres,
  //       this.studios,
  //       this.synopsis,
  //       this.nsfw,
  //       this.createdAt,
  //       this.updatedAt,
  //       this.mainPictureMedium,
  //       this.mainPictureLarge,
  //       this.alternativeTitlesEn,
  //       this.alternativeTitlesJa,
  //       this.alternativeTitlesSynonyms});

  AnimeList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mediaType = json['media_type'];
    mean = json['mean'];
    numScoringUsers = json['num_scoring_users'];
    status = json['status'];
    numEpisodes = json['num_episodes'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    source = json['source'];
    numListUsers = json['num_list_users'];
    popularity = json['popularity'];
    numFavorites = json['num_favorites'];
    rank = json['rank'];
    averageEpisodeDuration = json['average_episode_duration'];
    rating = json['rating'];
    startSeasonYear = json['start_season_year'];
    startSeasonSeason = json['start_season_season'];
    broadcastDayOfTheWeek = json['broadcast_day_of_the_week'];
    broadcastStartTime = json['broadcast_start_time'];
    genres = json['genres'];
    studios = json['studios'];
    synopsis = json['synopsis'];
    nsfw = json['nsfw'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mainPictureMedium = json['main_picture_medium'];
    mainPictureLarge = json['main_picture_large'];
    alternativeTitlesEn = json['alternative_titles_en'];
    alternativeTitlesJa = json['alternative_titles_ja'];
    alternativeTitlesSynonyms = json['alternative_titles_synonyms'];
  }

  Map<String, dynamic> toMap() {
    return
    {
    'id' : id,
    'title' : title,
    'media_type' : mediaType,
    'mean' : mean,
    'num_scoring_users' : numScoringUsers,
    'status' : status,
    'num_episodes' : numEpisodes,
    'start_date' : startDate,
    'end_date' : endDate,
    'source' : source,
    'num_list_users' : numListUsers,
    'popularity' : popularity,
    'num_favorites' : numFavorites,
    'rank' : rank,
    'average_episode_duration' : averageEpisodeDuration,
    'rating' : rating,
    'start_season_year' : startSeasonYear,
    'start_season_season' : startSeasonSeason,
    'broadcast_day_of_the_week' : broadcastDayOfTheWeek,
    'broadcast_start_time' : broadcastStartTime,
    'genres' : genres,
    'studios' : studios,
    'synopsis' : synopsis,
    'nsfw' : nsfw,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'main_picture_medium' : mainPictureMedium,
    'main_picture_large' : mainPictureLarge,
    'alternative_titles_en' : alternativeTitlesEn,
    'alternative_titles_ja' : alternativeTitlesJa,
    'alternative_titles_synonyms' : alternativeTitlesSynonyms,};

  }
}
