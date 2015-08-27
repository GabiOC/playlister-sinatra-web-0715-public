module Slugable
  def add_slug_for(field)
    define_method "#{field}=" do |new_value|
      super(new_value)
      update_slug
    end

    private
    define_method "update_slug" do
      source_field_value = self.public_send(field)
      self.slug = source_field_value.downcase.scan(/\w+/).join('-')
    end
  end
end
