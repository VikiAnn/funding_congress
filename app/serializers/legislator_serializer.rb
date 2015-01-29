class LegislatorSerializer < ActiveModel::Serializer
  attributes :id,
             :bioguide_id,
             :state,
             :full_name_and_title,
             :chamber,
             :photo_url,
             :twitter_url,
             :facebook_url,
             :youtube_url,
             :office,
             :phone,
             :website,
             :campaign_contributors
end
