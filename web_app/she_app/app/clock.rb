require 'clockwork'
include Clockwork

every(3.minutes, 'DM back'){
  `rake dm:get_dms`
}

every(3.minutes, 'retweet'){
  `rake dm:retweet`
}

every(3.minutes, 'favorite'){
  `rake dm:fav_tweet`
}

every(59.minutes, 'post'){
  `rake post:timeline_post`
}
