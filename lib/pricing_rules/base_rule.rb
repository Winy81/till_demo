module PricingRule
  class BaseRule

    CONFIG_PATH = File.expand_path('../../../config/pricing_rules.yml', __FILE__)

    def config
      @config ||= YAML.load_file(CONFIG_PATH)
    end

    def apply(items)
      0
    end

    private
 
    def select_items(items, product_code)
      matching_items = items.select { |item| item.code == product_code }
    end

    def rule_config
      config[self.class.name] || {}
    end
  end
end