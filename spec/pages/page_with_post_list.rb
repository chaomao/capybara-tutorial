module PageWithPostList
  include Gizmo::PageMixin

  def valid?
  	puts 'valid? in page list module'
  	has_css?('.parent .left')
  end

	def post_list
		find('.parent .left table')
	end
end