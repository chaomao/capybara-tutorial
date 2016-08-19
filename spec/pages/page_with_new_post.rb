module PageWithNewPost
	include Gizmo::PageMixin

	def valid?
		has_css?('#new_post')
	end

	def create_post_button
		find('.actions input[value="Create Post"]')
	end

	def notice_message
		find('#notice').text
	end

	def back_link
		find('a[href="/posts"]')
	end

	define_action :fill_post do |title, content|
		fill_in('post_title', with: title)
		fill_in('post_content', with: content)
	end
end
