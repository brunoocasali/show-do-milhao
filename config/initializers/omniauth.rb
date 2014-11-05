Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :facebook, '873747422659195', '6622234bfe75759c0e37e4943b173dd9', {:scope => 'email,
read_stream, read_friendlists, friends_likes, friends_status, offline_access'}

  # If you want to also configure for additional login services, they would be configured here.
end