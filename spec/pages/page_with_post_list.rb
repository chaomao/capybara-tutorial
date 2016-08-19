module PageWithPostList
	include Gizmo::PageMixin

	module PostRow
		def name
			self.all('td')[0].text
		end

		def content
			self.all('td')[1].text
		end
	end

	def valid?
		has_css?('.parent .left')
	end

	def posts_in_list
		find('.parent .left table').find('tbody').all('tr')
	end

	def first_post_in_list
		posts_in_list.first.extend(PostRow)
	end

	def new_post_link
		find('.parent .left a[href="/posts/new"]')
	end
end
