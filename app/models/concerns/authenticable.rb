module Authenticable
  extend ActiveSupport::Concern

  FACEBOOK_FIELDS = %w(id first_name last_name)
  VK_FIELDS = %i(photo_max_orig screen_name bdate email domain)

  module ClassMethods
    def find_or_create_from_vk(vk)
      vk_user = vk.users.get(fields: VK_FIELDS).first
      user = find_by(vk_id: vk_user.uid)

      user || create!(
        first_name: vk_user.first_name, last_name: vk_user.last_name, vk_id: vk_user.uid,
      )
    end

    def find_or_create_from_fb(graph)
      fb_user = graph.get_object('me', FACEBOOK_FIELDS)
      user = find_by(fb_id: fb_user['id'])

      user || create!(
        first_name: fb_user['first_name'], last_name: fb_user['last_name'], fb_id: fb_user['id']
      )
    end
  end
end
