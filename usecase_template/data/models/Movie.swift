//
//  Movie.swift
//  usecase_template
//
//  Created by OLUNUGA Mayowa on 28/01/2020.
//  Copyright © 2020 OLUNUGA Mayowa. All rights reserved.
//

import Foundation

struct Movie  : Decodable{
    var title : String
    var posterUrl : String
    var backdropUrl : String
    var voteCount: UInt32
    var voteAverage: Float
    var hasVideo : Bool
}


enum MovieType{
    case Popular
    case NowPlaying
    case TopRated
}

/*
 {
 "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
 "adult": false,
 "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
 "release_date": "2016-08-03",
 "genre_ids": [
 14,
 28,
 80
 ],
 "id": 297761,
 "original_title": "Suicide Squad",
 "original_language": "en",
 "title": "Suicide Squad",
 "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
 "popularity": 48.261451,
 "vote_count": 1466,
 "video": false,
 "vote_average": 5.91
 }
 */



/*
 {
 "adult": false,
 "backdrop_path": "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg",
 "belongs_to_collection": null,
 "budget": 63000000,
 "genres": [
 {
 "id": 18,
 "name": "Drama"
 }
 ],
 "homepage": "",
 "id": 550,
 "imdb_id": "tt0137523",
 "original_language": "en",
 "original_title": "Fight Club",
 "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
 "popularity": 0.5,
 "poster_path": null,
 "production_companies": [
 {
 "id": 508,
 "logo_path": "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png",
 "name": "Regency Enterprises",
 "origin_country": "US"
 },
 {
 "id": 711,
 "logo_path": null,
 "name": "Fox 2000 Pictures",
 "origin_country": ""
 },
 {
 "id": 20555,
 "logo_path": null,
 "name": "Taurus Film",
 "origin_country": ""
 },
 {
 "id": 54050,
 "logo_path": null,
 "name": "Linson Films",
 "origin_country": ""
 },
 {
 "id": 54051,
 "logo_path": null,
 "name": "Atman Entertainment",
 "origin_country": ""
 },
 {
 "id": 54052,
 "logo_path": null,
 "name": "Knickerbocker Films",
 "origin_country": ""
 },
 {
 "id": 25,
 "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
 "name": "20th Century Fox",
 "origin_country": "US"
 }
 ],
 "production_countries": [
 {
 "iso_3166_1": "US",
 "name": "United States of America"
 }
 ],
 "release_date": "1999-10-12",
 "revenue": 100853753,
 "runtime": 139,
 "spoken_languages": [
 {
 "iso_639_1": "en",
 "name": "English"
 }
 ],
 "status": "Released",
 "tagline": "How much can you know about yourself if you've never been in a fight?",
 "title": "Fight Club",
 "video": false,
 "vote_average": 7.8,
 "vote_count": 3439
 }
 */
