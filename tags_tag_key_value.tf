#Creating a key called source
resource "google_tags_tag_key" "source_key" {
  parent      = "projects/planar-catbird-293204"
  short_name  = "source"
  description = "source key"
}

#Generating values for above mentioned key

resource "google_tags_tag_value" "source_adt_tag" {
  parent      = "tagKeys/${google_tags_tag_key.source_key.name}"
  short_name  = "adt"
  description = "Source adt tag"
}

resource "google_tags_tag_value" "source_bdt_tag" {
  parent      = "tagKeys/${google_tags_tag_key.source_key.name}"
  short_name  = "bdt"
  description = "Source bdt tag"
}

resource "google_tags_tag_value" "source_cdt_tag" {
  parent      = "tagKeys/${google_tags_tag_key.source_key.name}"
  short_name  = "cdt"
  description = "Source cdt tag"
}
