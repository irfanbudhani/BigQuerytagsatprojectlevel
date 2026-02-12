# 1. Create the Tag Key
resource "google_tags_tag_key" "PPT_key" {
  parent     = "projects/${var.project_id}"
  short_name = "source"
  description = "Tag key for PPT access control"
}

# 2. Create the Tag Value "PPT"
resource "google_tags_tag_value" "PPT_value" {
  parent     = "tagKeys/${google_tags_tag_key.PPT_key.name}"
  short_name = "PPT"
  description = "Tag for PPT datasets"
}

# 3. Bind the Tag to the 5 datasets
resource "google_tags_tag_binding" "dataset_bindings" {
  for_each  = toset(var.PPT_datasets)
  parent    = "//bigquery.googleapis.com/projects/${var.project_id}/datasets/${each.value}"
  tag_value = "tagValues/${google_tags_tag_value.PPT_value.name}"
}

# 4. Grant BigQuery Viewer to the AD group with a Condition
resource "google_project_iam_member" "PPT_viewer_binding" {
  project = var.project_id
  role    = "roles/bigquery.dataViewer"
  member  = var.PPT_ad_group

  condition {
    title       = "Access PPT Datasets Only"
    description = "Grant access if the dataset has the 'PPT' tag"
    # Use namespaced name for the tag key to ensure accurate matching
    expression  = "resource.matchTag('${var.project_id}/source', 'PPT')"
  }
}
