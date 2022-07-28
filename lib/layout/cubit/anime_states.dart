abstract class AnimeStates{}

class SocialInitialState extends AnimeStates{}

class AnimeBuildListLoadingState extends AnimeStates{}

class AnimeBuildListSuccessState extends AnimeStates{}

class AnimeBuildListErrorState extends AnimeStates{

  final String error;
  AnimeBuildListErrorState(this.error);
}

class AnimeScrollBotListSuccessState extends AnimeStates{}

class AnimeScrollTopListSuccessState extends AnimeStates{}

class AnimeChangeThemeModeState extends AnimeStates{}

class SocialGetPostsLoadingState extends AnimeStates{}

class SocialGetPostsSuccessState extends AnimeStates{}

class SocialGetPostsErrorState extends AnimeStates{

  final String error;
  SocialGetPostsErrorState(this.error);
}

class SocialGetUsersLoadingState extends AnimeStates{}

class SocialGetUsersSuccessState extends AnimeStates{}

class SocialGetUsersErrorState extends AnimeStates{

  final String error;
  SocialGetUsersErrorState(this.error);
}

class SocialGetLikesLoadingState extends AnimeStates{}

class SocialGetLikesSuccessState extends AnimeStates{}

class SocialGetLikesErrorState extends AnimeStates{

  final String error;
  SocialGetLikesErrorState(this.error);
}

class SocialGetCommentsLoadingState extends AnimeStates{}

class SocialGetCommentsSuccessState extends AnimeStates{}

class SocialGetCommentsErrorState extends AnimeStates{

  final String error;
  SocialGetCommentsErrorState(this.error);
}

class SocialUpdateUserDataLoadingState extends AnimeStates{}

class SocialUpdateUserDataSuccessState extends AnimeStates{}

class SocialUpdateUserDataErrorState extends AnimeStates{

  final String error;
  SocialUpdateUserDataErrorState(this.error);
}

class SocialPickedProfileImageSuccessState extends AnimeStates{}

class SocialPickedProfileImageErrorState extends AnimeStates{}

class SocialPickedCoverImageSuccessState extends AnimeStates{}

class SocialPickedCoverImageErrorState extends AnimeStates{}

class SocialPickedPostImageSuccessState extends AnimeStates{}

class SocialPickedPostImageErrorState extends AnimeStates{}

class SocialPickedChatImageSuccessState extends AnimeStates{}

class SocialPickedChatImageErrorState extends AnimeStates{}

class SocialUploadProfileImageLoadingState extends AnimeStates{}

class SocialUploadProfileImageSuccessState extends AnimeStates{}

class SocialUploadProfileImageErrorState extends AnimeStates{}

class SocialUploadCoverImageLoadingState extends AnimeStates{}

class SocialUploadCoverImageSuccessState extends AnimeStates{}

class SocialUploadCoverImageErrorState extends AnimeStates{}

class SocialUploadPostImageLoadingState extends AnimeStates{}

class SocialUploadPostImageSuccessState extends AnimeStates{}

class SocialUploadPostImageErrorState extends AnimeStates{}

class SocialAddNewPostLoadingState extends AnimeStates{}

class SocialAddNewPostSuccessState extends AnimeStates{}

class SocialAddNewPostErrorState extends AnimeStates{}


class SocialLikePostSuccessState extends AnimeStates{}

class SocialLikePostErrorState extends AnimeStates{}

class SocialCommentPostSuccessState extends AnimeStates{}

class SocialCommentPostErrorState extends AnimeStates{}

class SocialChangePostLikeState extends AnimeStates{}

class SocialRemovePostImage extends AnimeStates{}

class SocialRemoveChatImage extends AnimeStates{}

class AnimeChangeBotNavBarState extends AnimeStates{}

class SocialAddPostState extends AnimeStates{}

class SocialSendMsgSuccessState extends AnimeStates{}

class SocialSendMsgErrorState extends AnimeStates{}

class SocialGetMsgsSuccessState extends AnimeStates{}