module PageWithPostList
	include Gizmo::PageMixin

	def valid?
		has_css?('.parent .left')
	end

	def posts_in_list
		find('.parent .left table').find('tbody').all('tr')
	end

	def new_post_link
		find('.parent .left a[href="/posts/new"]')
	end

	def notice_message
		find('#notice').text
	end

	def back_link
		find('a[href="/posts"]')
	end
end