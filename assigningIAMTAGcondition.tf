#Assigning IAM role based on a tag condition

resource "google_project_iam_member" "adt_user" {
  project = "planar-catbird-293204"
  role    = "roles/bigquery.dataViewer"
  member  = "user:budhaniirfan88@gmail.com"
  condition {
    title       = "only-adt"
    expression  = "resource.matchTag('planar-catbird-293204/source', 'adt')"
    description = "Only view the dataset with tag of adt."
  }
}
