# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.7"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "name" {
  artist = "Eminem"
}

resource "spotify_playlist" "slimShady"{
  name = "Slim Shady"
  tracks = [data.spotify_search_track.name.tracks[0].id, data.spotify_search_track.name.tracks[1].id, data.spotify_search_track.name.tracks[2].id]
}

resource "spotify_playlist" "Tollywood" {
  name        = "Terraform Summer Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = ["538V6gFAnhcLZrg6I8lIMI"]
}
