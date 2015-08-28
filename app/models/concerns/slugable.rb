module Slugable
  def add_slug_for(field)

=begin
** define_method vs. def **
- define_method: used for method defined within module. implicit receiver is 'self'. takes a block as body
and variables assigned outside are accessible in define_method
- def: implicit receiver is the default definee (not self). variables defined outside are not accessible inside
and vice versa.

## define_method is used here so we can interpolate 'field' to equal name parameter in the models. we also use it
as we're calling it on self, which is the class Artist, Song, etc.
=end
    define_method "#{field}=" do |new_value|

=begin
** super **
aka method overriding
Usually, the method in the subclass overrides the method in the superclass. Using 'super' lets you
send a message to the parent of the current object, asking it to invoke a method of the same name
as the method invoking super.

In this case, we're using it so that we can override the add_slug_for method and invoke the method (and arguments)
in the Artist, Song, etc. class.
=end
      super(new_value)
      update_slug
    end

    private
    define_method "update_slug" do
=begin public_send vs. send:
- send lets you send a message to any private or public method
- public_send only lets you send a message to public method
=end
      source_field_value = self.public_send(field)
      self.slug = source_field_value.downcase.scan(/\w+/).join('-')
    end
  end
end
