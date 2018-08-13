ActiveRecord::Schema.define(version: 20180807085316) do

  enable_extension "plpgsql"

  create_table "letters", force: :cascade do |t|
    t.text "content"
    t.datetime "timenow"
  end

end
