require 'clockwork'
include Clockwork

every(1.minutes, 'DM back'){
  `rake dm:get_dms`
}

every(1.minutes, 'retweet'){
  `rake dm:retweet`
}

every(1.minutes, 'favorite'){
  `rake dm:fav_tweet`
}

every(59.minutes, 'post'){
  `rake post:timeline_post`
}
