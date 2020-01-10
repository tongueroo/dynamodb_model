class <%= @migration_class_name %> < Dynomite::Migration
  def up
    create_table :<%= @table_name %> do |t|
      t.partition_key "<%= @partition_key %>" # required
<% if @sort_key # so extra spaces are not added when generated -%>
      t.sort_key  "<%= @sort_key %>" # optional
<% end -%>
      t.billing_mode "PAY_PER_REQUEST"

      # Either use billing_mode = "PAY_PER_REQUEST" or provisioned_throughput. Cannot use both.
      # t.provisioned_throughput(<%= @provisioned_throughput %>) # sets both read and write, defaults to 5 when not set

      # Instead of using partition_key and sort_key you can set the
      # key schema directly also
      # t.key_schema([
      #     {attribute_name: "id", :key_type=>"HASH"},
      #     {attribute_name: "created_at", :key_type=>"RANGE"}
      #   ])
      # t.attribute_definitions([
      #   {attribute_name: "id", attribute_type: "N"},
      #   {attribute_name: "created_at", attribute_type: "S"}
      # ])

      # other ways to set provisioned_throughput
      # t.provisioned_throughput(:read, 10)
      # t.provisioned_throughput(:write, 10)
      # t.provisioned_throughput(
      #   read_capacity_units: 5,
      #   write_capacity_units: 5
      # )
    end
  end
end

# More examples: https://github.com/tongueroo/dynomite/tree/master/docs
