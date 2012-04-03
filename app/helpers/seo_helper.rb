# coding: utf-8
module SeoHelper
  # Set HTML title
  def title_tag(*args)
    delimiter = " — "
    content_for(:title, collect_params_for_tag(delimiter, args).join(delimiter))
  end

  def meta_description_tag(*args)
    delimiter = " "
    content_for(:meta_description, collect_params_for_tag(delimiter, args).join(delimiter))
  end

  def meta_keywords_tag(*args)
    delimiter = ", "
    content_for(:meta_keywords, collect_params_for_tag(delimiter, args).join(delimiter))
  end

  private
    def collect_params_for_tag(*args)
      str = []

      delimiter = args.shift

      args.each do |arg|
        str << case arg
          when String then h(arg)
          when Array  then h(arg.join(delimiter))
          else arg.to_s rescue ""
        end
      end

      str
    end
end
