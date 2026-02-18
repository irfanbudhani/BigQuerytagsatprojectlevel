data "google_tags_tag_key" "source_key" {
  parent     = "projects/planar-catbird-293204"
  short_name = "source"
}

data "google_tags_tag_value" "source_adt_tag" {
  parent     = "tagKeys/${data.google_tags_tag_key.source_key.name}"
  short_name = "adt"
}

data "google_tags_tag_value" "source_bdt_tag" {
  parent     = "tagKeys/${data.google_tags_tag_key.source_key.name}"
  short_name = "bdt"
}

data "google_tags_tag_value" "source_cdt_tag" {
  parent     = "tagKeys/${data.google_tags_tag_key.source_key.name}"
  short_name = "cdt"
}

resource "google_tags_location_tag_binding" "adt" {
  provider  = google-beta
  parent    = "//bigquery.googleapis.com/projects/planar-catbird-293204/datasets/adt_dataset"
  tag_value = data.google_tags_tag_value.source_adt_tag.id
  location  = "australia-southeast1"
}

resource "google_tags_location_tag_binding" "bdt" {
  provider  = google-beta
  parent    = "//bigquery.googleapis.com/projects/planar-catbird-293204/datasets/bdt_dataset"
  tag_value = data.google_tags_tag_value.source_bdt_tag.id
  location  = "australia-southeast1"
}

resource "google_tags_location_tag_binding" "cdt" {
  provider  = google-beta
  parent    = "//bigquery.googleapis.com/projects/planar-catbird-293204/datasets/cdt_dataset"
  tag_value = data.google_tags_tag_value.source_cdt_tag.id
  location  = "australia-southeast1"
}
