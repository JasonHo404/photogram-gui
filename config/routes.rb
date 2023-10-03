Rails.application.routes.draw do
  get("/", {controller: "users", action: "index"})
  get("/users", {controller: "users", action: "index"})
  get("/users/:username", {controller: "users", action: "show"})
  get("/add_user", {controller: "users", action: "add_user"})
  post("/update_user/:user_id", {controller: "users", action: "update_user"})

  get("/photos", {controller: "photos", action: "index"} )
  get("/photos/:photo_id", {controller: "photos", action: "show"})
  get("/delete_photo/:photo_id", {controller: "photos", action: "destroy"})
  post("/insert_photo_record", {controller: "photos", action: "post_photo"})
end
